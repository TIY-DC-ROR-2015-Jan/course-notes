require './game'
require './player'

g = Game.new
p = DumbAI.new

until g.over?
	guess = p.get_guess
	puts "You guessed: #{guess}"
	
	response = g.check_guess guess
	puts response
end

puts "You lost, loser" if g.lost?