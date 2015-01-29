# TODO: Track player names?

# You have to roll once
current_player = 1
max_score = 10
p1_score = 0
p2_score = 0

def roll_dice total_so_far
  roll = rand(1..6)

  # Decide to hold or roll
  puts "You rolled a #{roll}."
  if roll == 1
  	# Turn over
    puts "Bad news :("
    return 0
  else
    total_so_far += roll
    puts "Roll again (turn total so far #{total_so_far})? (y/n)"
    decision = gets.chomp
    if decision == "y"
      return roll_dice(total_so_far)
    else # held, get all of the running total points to keep
      return total_so_far
      # it should now be player 2's turn
    end
  end
end

def take_turn
  roll_dice 0
end

# until somebody wins
# player 1 takes a turn
# player 2 takes a turn
# repeat

until p1_score >= max_score || p2_score >= max_score
  puts "It is now player 1's turn. Current score: #{p1_score}"
  p1_score += take_turn

  puts
  puts

  puts "It is now player 2's turn. Current score: #{p2_score}"
  p2_score += take_turn

  puts
  puts
end

puts "Player 1: #{p1_score}"
puts "Player 2: #{p2_score}"
if p1_score > p2_score
  puts "Player 1 wins"
elsif p1_score == p2_score
  puts "It's a tie"
else
  puts "Player 2 wins"
end