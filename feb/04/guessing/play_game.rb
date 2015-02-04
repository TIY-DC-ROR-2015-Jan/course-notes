require './game'
require './player'

g = Game.new

puts "Choose mode"
puts "1) Human"
puts "2) Dumb AI"
puts "3) Smart AI"
choice = gets.chomp.to_i

player_class = if choice == 1
  Player
elsif choice == 2
  DumbAI
else
  SmartAI
end
p = player_class.new

until g.over?
	guess = p.get_guess
	puts "You guessed: #{guess}"

	response = g.check_guess guess
	p.update_guess response
	puts response
end

puts "You lost, loser" if g.lost?