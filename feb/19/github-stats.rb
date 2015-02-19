require 'httparty'
require 'pry'

# Thought process:
# * I ultimately want to build up a hash of
#   user name => [ additions, deletions, changes ]
# So let's make an object that's responsible for doing that:
class StatAggregator
  attr_reader :stats # we'll want these when we're done
  def initialize
    # We start with an empty hash of stats
    @stats = {}
  end

  # At a conceptual level, here's what we need to do
  # Again, this is wishful-thinking-coding, but the end result is
  # 1) small bits of logic that I think I can implement and
  # 2) a readable description of what this object does
  def do_your_stuff! organization_name
    get_members_for_org organization_name
    get_repositories_for_all_members
    get_stats_for_repositories
  end

private
  # This keeps people from calling `get_repositories_for_members` directly, since
  #   it will break if it is called before `get_members_for_org` (why?)
  def get_members_for_org organization_name
    # Need to call GET /orgs/:org/members
    # Member names will be the keys in our @stats hash, so we can keep them there
    GithubApi.get("/orgs/#{organization_name}/members").each do |m|
      member_name = m["login"]
      # Initially, no additions, deletions, or changes
      @stats[ member_name ] = { "a" => 0, "d" => 0, "c" => 0 }
    end
  end

  def get_repositories_for_all_members
    @repositories = []
    @stats.each do |member_name, _|
      # This is complicated, so I'll punt ...
      add_repositories_for_member member_name
    end
  end

  # ... And then worry about it here, where I'm not in the middle of an `each`
  def add_repositories_for_member name
    # For a single repo, we'd call
    # GET /users/:username/repos (see https://developer.github.com/v3/repos/#list-user-repositories)
    GithubApi.get("/users/#{name}/repos").each do |r|
      @repositories << r["full_name"]
    end
  end

  def get_stats_for_repositories
    # For a single repo, we'd call
    # GET /repos/:owner/:repo/stats/contributors (see https://developer.github.com/v3/repos/statistics/#contributors)
    @repositories.each do |r|
      # r is already "user-name/repo-name"
      GithubApi.get("/repos/#{r}/stats/contributors").each do |stat|
        record_stat stat
      end
    end
  end

  def record_stat stat
    # A single stat looks like
    # { "weeks" => [ {"w" => _, "a" => _, "d" => _, "c" => _ }, ... ],
    #   "author" => { "login" => _, ... } }
    author_name = stat["author"]["login"]
    stat["weeks"].each do |week|
      @stats[author_name]["a"] += week["a"]
      @stats[author_name]["d"] += week["d"]
      @stats[author_name]["c"] += week["c"]
    end
  rescue
    # We probably should figure out what the errors are and handle them better
    # For now, just skip recording this stat ...
  end
end

# I promised myself one of these ...
class GithubApi
  include HTTParty
  base_uri "https://api.github.com"
  default_params access_token: ENV["GITHUB_TOKEN"]
end

# Now put it all together!
ag = StatAggregator.new
ag.do_your_stuff! "TIY-DC-ROR-2015-Jan"

# All done. Let's see.
ag.stats.each do |user, counts|
  puts "#{user}\t\t#{counts["a"]}\t\t#{counts["d"]}\t\t#{counts["c"]}"
end
