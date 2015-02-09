class Board
  def initialize
    @squares = {}
    ('A'..'J').each do |row|
      @squares[row] = {}
      (1..10).each do |col|
        @squares[row][col] = Cell.new
      end
    end
  end

  def to_s
    fail
  end

  def without_ships
    fail
  end

  def occupied? row, col
    cell = @square[row][col]
    if cell.ship
      true
    else
      false
    end
  end

  def fire_on! row, col
    cell = @square[row][col]
    cell.get_hit!
  end
end

class Player
  def get_move opponent_board
    # Print my board
    # Print opp board w/o ships
    # gets.chomp & check?
  end

  def record_move row, col
    @board.fire_on! row, col
    if @board.occupied? row, col
      :hit
    else
      :miss
    end
  end
end

class Battleship
  def initialize name1, name2
    @p1 = Player.new name1
    @p2 = Player.new name2
  end

  def play_round
    take_turn @p1, @p2
    return if @p2.sunk?
    take_turn @p2, @p1
  end

  def take_turn player, opponent
    row, col = player.get_move opponent.board.without_ships

    result = opponent.record_move row, col
    case result
    when :hit
      puts "It's a hit!"
    when :miss
      puts "Missed!"
    when :invalid
      puts "You're trying to cheat"
    end
  end

  def winner
    fail
  end
end

print "Player 1's name > "
name1 = gets.chomp

print "Player 2's name > "
name2 = gets.chomp

game = Battleship.new name1, name2
game.play_round until game.winner