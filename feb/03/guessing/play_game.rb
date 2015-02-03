require './game'

g = Game.new

until g.over?
	print "What is your guess? "
	guess = gets.chomp.to_i

	response = g.check_guess guess
	puts response
end

puts "You lost, loser" if g.lost?