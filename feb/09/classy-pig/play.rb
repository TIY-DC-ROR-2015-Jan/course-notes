require_relative './pig'
require_relative './hog'

def select_from hash
  loop do
    hash.each do |k,v|
      puts "#{k}) #{v}"
    end
    print "? "
    input = gets.chomp
    found = hash.find { |k,v| k.to_s == input || v.to_s == input }
    if found
      return found.last
    else
      puts "Invalid selection: #{input}. Please try again."
    end
  end
end

game_classes = {
  1 => Pig,
  2 => Hog
}
game_class = select_from game_classes

puts "Playing a game of #{game_class}"
game = game_class.new

game.get_players

game.play_round until game.winner
puts "#{game.winner} wins!"
