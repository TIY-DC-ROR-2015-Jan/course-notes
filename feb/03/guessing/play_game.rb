require './game'
require './player'

g = Game.new

puts "Choose mode"
puts "1) Human"
puts "2) Dumb AI"
puts "3) Smart AI"
choice = gets.chomp.to_i

p = if choice == 1
  Player.new
elsif choice == 2
  DumbAI.new
else
  SmartAI.new
end

until g.over?
	guess = p.get_guess
	puts "You guessed: #{guess}"

	response = g.check_guess guess
	p.update_guess response
	puts response
end

puts "You lost, loser" if g.lost?