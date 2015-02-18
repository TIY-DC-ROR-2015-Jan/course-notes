require 'pry'
require 'httparty'

class Player
  include HTTParty
  base_uri "http://localhost:4567"

  def method_missing name, *args
    Player.post "/#{name}", query: { v: [1,2].sample }
  end
end

p = Player.new

loop do
  p.harder
  p.better
  p.faster
  p.stronger
end