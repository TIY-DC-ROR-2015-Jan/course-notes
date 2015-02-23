require 'sinatra/base'
require 'httparty'

require 'pry'

# For now, this is just a simple repeater of the Github API
# Making a GET request to `/users/:username` should show the
#   public Github repositories for that user
# Your calls to Github don't need to be authenticated, but it
#   would be a nice bonus to add a mechanism to do so
def prompt_for_token
  return ENV["GITHUB_TOKEN"] if ENV["GITHUB_TOKEN"]
  print "Enter your github token: "
  gets.chomp
end

def find_repos username
  token = prompt_for_token
  repos = HTTParty.get("https://api.github.com/users/#{username}/repos", headers: {"Authorization" => "token #{token}", "User-Agent" => "anything"})
  # user_repos = repos.map {|x| x["name"]}
  # user_repos
end

class GithubRepeater < Sinatra::Base
  get '/users' do
    @repos = find_repos params[:username]
    erb :repo_list
    # content_type :json
    # @repos.to_json
  end

  post '/take_post' do
    puts params
    content_type :json
    params.to_json
  end
end

GithubRepeater.run!
