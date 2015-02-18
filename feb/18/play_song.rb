require 'pry'


class Player
  def method_missing name, *args
    v = [1,2].sample
    `curl -XPOST http://localhost:4567/#{name}?v=#{v}`
  end
end

p = Player.new

loop do
  p.harder
  p.better
  p.faster
  p.stronger
end