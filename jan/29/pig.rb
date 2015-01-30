# TODO: Track player names?

current_player = 1
max_score = 10
p1_score = 0
p2_score = 0

def take_turn
  turn_total = 0
  loop do
    roll = rand(1..6)
    puts "You rolled a #{roll}."

    if roll == 1
      puts "Bad news :("
      return 0

    else
      turn_total += roll

      puts "Roll again (turn total so far #{turn_total})? (y/n)"
      if gets.chomp == "n"
        return turn_total
      end
    end
  end
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
