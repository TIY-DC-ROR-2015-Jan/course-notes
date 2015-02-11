require 'pry'
require './db/setup'
require './lib/hangman'
require './lib/history'

# Ask for name
print "What is your name? > "
name = gets.chomp

# Look up history
# #first_or_create!
# history = History.where(name: name).first_or_create! ...
ph = History.where(name: name).first
if ph
  puts "Welcome back, #{name}"
  puts "Your history: #{ph.total} games played, #{ph.wins} wins, #{ph.losses} losses (#{ph.percentage}%)"
else
  ph = History.create(name: name, wins: 0, losses: 0)
end

# If there was a prexisting game, h should be that
if ph.answer.nil?
  puts "Starting a new game"
  h = Hangman.new
else
  # Need to set answer, guesses_left and guesses
  puts "Picking back up from where you left off"
  h = Hangman.new(
    answer:       ph.answer,
    guesses_left: ph.tries_left,
    guesses:      ph.guesses.split("") # Need an array, not string
  )
end

begin
  until h.over?
    print "> "
    guess = gets.chomp

    puts h.check_guess guess
  end
rescue Interrupt
  puts "We should save something here ..."
  # Write where we are to the history
  ph.update(
    tries_left: h.guesses_left,
    answer:     h.answer,
    guesses:    h.guesses.join("")
  )
  exit
end

# Clear out previous game ... ?
ph.update(tries_left: nil, answer: nil, guesses: nil)

# Update history
if h.won?
  puts "You won!"
  ph.wins += 1
  ph.save!
else
  puts "You lost! The word was #{h.answer}"
  ph.losses += 1
  ph.save!
end

puts "Your record is now: #{ph.total} games played, #{ph.wins} wins, #{ph.losses} losses (#{ph.percentage}%)"
