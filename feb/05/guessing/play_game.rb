require './game'
require './hangman'
require './player'

# puts "Choose mode"
# puts "1) Guessing Game"
# puts "2) Hangman"
# choice = gets.chomp.to_i

# if choice == 1
#   game_class = Game
# else
#   game_class = Hangman
# end
# g = game_class.new

print "Minimum number > "
low = gets.chomp.to_i
print "Maximum number > "
high = gets.chomp.to_i
# print "Guesses > "
# guesses = gets.chomp.to_i

g = Game.new { :low => low, :high => high }
p = Player.new

until g.over?
  guess = p.get_guess
  puts "You guessed: #{guess}"

  response = g.check_guess guess
  p.update_guess response
  puts response
end

if g.won?
  puts "You won!!!"
elsif g.lost?
  puts "You lost, loser"
  puts "The answer was: #{g.answer}"
end