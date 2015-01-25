#!/usr/bin/ruby
# ^- tells the shell to run this script using _system_ ruby
#
# Checks your system to ensure that it's setup as expected:
# * on the right OSX
# * has developer tools, brew, a recent git and an editor
# * is using rbenv for
#   * ruby
#   * bundler
#
# Should this do anything else? Enforce that a git username is set?


# -- Color helpers -----

class String
  def colorize color_code
    "\033[#{color_code}m#{self}\033[0m"
  end
  def in_red;    colorize 31; end
  def in_green;  colorize 32; end
  def in_yellow; colorize 33; end
  def in_blue;   colorize 36; end
end

def alert string
  warn string.in_yellow
end


# -- Testing helpers -----

def suggest_match title, command, pattern, alternatively=nil
  value = `#{command}`.strip
  print "#{title.in_blue} ~ #{command} => #{value} ... "

  passed = value.include? pattern

  if passed
    puts "Ok".in_green
  else
    puts "FAILED (Expected #{pattern})".in_red
    puts alternatively.in_yellow if alternatively
  end

  passed
end

def require_match title, value, matcher
  passed = suggest_match title, value, matcher
  unless passed
    puts "#{title} is required. Refusing to proceed.".in_red
    exit 1
  end
end


# -- Checks to perform ----

suggest_match "OSX Version", "sw_vers -productVersion", "10.10"
  "Using an unconventional OSX version. Proceed at your own risk."
suggest_match "Project folder", "ls ~ | grep src", "src",
  "Organize however you like, but I'll be referring to a 'source' folder at `~/src`"
require_match "Developer Tools", "which gcc", "gcc"
require_match "Brew", "which brew", "/usr/local/bin/brew"
suggest_match "Git", "git --version", "version 2",
  "Make sure you have installed a recent version of Git"
suggest_match "Git Name", "git config --global user.name", " ", # Ew. Why?
  "Configure your git name with `git config --global user.name 'Your Name'`"
suggest_match "Git Email", "git config --global user.email", "@",
  "Configure your git email with `git config --global user.email 'youremail@whatever.com'`"
require_match "SSH Key", "ls ~/.ssh/id_rsa* | grep pub", ".ssh/id_rsa.pub"
suggest_match "Sublime", "which subl", "subl",
  "Can't find `subl`. Be sure you've installed the command line tools if you're using Sublime"

RBENV_ROOT = "#{ENV['HOME']}/.rbenv"
RB_VERSION = "2.2.0"
require_match "Rbenv", "which rbenv", "#{RBENV_ROOT}/bin/rbenv"
require_match "Ruby shim", "which ruby", "#{RBENV_ROOT}/shims/ruby"
require_match "Ruby version", "rbenv versions | grep '*'", "#{RB_VERSION}"

gems = {
  "Bundler" => "bundle",
  "Pry"     => "pry"
}
gems.each do |name, command|
  require_match name, "rbenv which #{command}", "#{RBENV_ROOT}/versions/#{RB_VERSION}/bin/#{command}"
end


# -- If we're here, we're clear! -----

chars =  ["═", "\n", "╝", "╔", "█", "╗", "╚", " ", "║"]
secret_message = 1444444577444444577444444544577445777774444445744457774451443004454430004454430000244874432777744300044544445774481444444324487774484487777744444327777744877744844344574481443004454487774484487777744304457777744877744844864454481448774486444444326444444544877445777764444443244876444481602776027600000277600000260277602777776000002760277600021

decoded = secret_message.to_s.each_char.map do |digit|
  translated = chars[digit.to_i]
  if digit == "4"
    translated.in_yellow
  else
    translated.in_green
  end
end.join ''

puts %{
#{decoded}

Your system is all set!

You should check and make sure your #{'Github account'.in_green} is good to go, namely:
* you've accepted membership in the class organization (and publicized it, as you like)
* you've added your #{'ssh key'.in_green}. See #{'https://help.github.com/articles/generating-ssh-keys'.in_blue} for more info.

}
