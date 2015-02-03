require './game'
require './player'

g = Game.new
p = SmartAI.new

until g.over?
	guess = p.get_guess
	puts "You guessed: #{guess}"

	response = g.check_guess guess
	p.update_guess response
	puts response
end

puts "You lost, loser" if g.lost?