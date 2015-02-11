require 'pry'

class Ship
  attr_reader :name, :length

  def initialize name, length
    @name, @length = name, length
    @health = length
  end

  def hit!
    @health -= 1
    if @health == 0
      `say "You sunk my #{@name}"`
    end
  end

  def sunk?
    @health <= 0
  end
end

class Cell
  attr_accessor :ship

  def initialize
    @fired_on = false
  end

  def is_shot!
    @fired_on = true
    @ship.hit! if @ship
  end

  def occupied?
    @ship ? true : false
  end

  def fired_on?
    @fired_on
  end

  def hit?
    occupied? && fired_on?
  end

  def missed?
    fired_on? && !occupied?
  end
end

class Board
  attr_reader :ships

  def initialize
    @squares = {}
    ('A'..'I').each do |row|
      @squares[row] = {}
      (1..9).each do |col|
        @squares[row][col] = Cell.new
      end
    end

    @ships = {
      "Carrier"     => 5,
      "Battleship"  => 4,
      "Submarine"   => 3,
      "Destroyer"   => 3,
      "Patrol Boat" => 2
    }.map { |name, length| Ship.new name, length }
  end

  def cell row, col
    @squares[row] && @squares[row][col]
  end

  def in_bounds? row, col
    !cell(row, col).nil?
  end

  def valid? row, col
    c = cell(row,col)
    c && !c.fired_on?
  end

  def occupied? row, col
    cell(row,col).occupied?
  end

  def fire_on! row, col
    cell(row,col).is_shot!
  end

  def place_ship ship, row, col, orientation
    # TODO: needs to handle 'h', overlaps, out of bounds
    if orientation == "v"
      raise "Not Implemented"
    else
      (0 ... ship.length).each do |i|
        @squares[row][col + i].ship = ship
      end
    end
  end

  def display show_ships
    result  = "  1|2|3|4|5|6|7|8|9\n"
    result += "-------------------\n"
    @squares.each do |letter, row|
      result += "#{letter}|"
      result += row.map do |col, cell|
        if cell.hit?
          "X"
        elsif cell.missed?
          "-"
        elsif cell.ship && show_ships
          cell.ship.name.split("").first
        else
          " "
        end
      end.join "|"
      result += "\n"
    end
    result
  end

  def to_s
    display true
  end
  def without_ships
    display false
  end
end

class Player
  attr_reader :name, :board

  def initialize name
    @name  = name
    @board = Board.new
  end

  def get_location prompt
    print "#{prompt} > "
    loop do
      input = gets.chomp
      row, col = input.split ''
      row = row.upcase
      col = col.to_i
      if @board.in_bounds? row, col
        return row, col
      else
        puts "Invalid location"
      end
    end
  end

  def place_ships
    @board.ships.each do |ship|
      puts @board.to_s
      puts "Placing #{ship.name}"
      row, col = get_location "Top / left corner"
      print "Orientation (h/v)? > "
      orientation = gets.chomp
      @board.place_ship ship, row, col, orientation
    end
  end

  def get_move opponent_board
    puts @board.to_s
    puts
    puts "~" * 20
    puts
    puts opponent_board.without_ships
    puts
    get_location "Your move, Captain?"
  end

  def was_hit? row, col
    raise KeyError unless @board.valid?(row, col)

    if @board.occupied?(row, col)
      @board.fire_on!(row, col)
      true
    else
      false
    end
  end

  def sunk?
    @board.ships.all? { |s| s.sunk? }
  end
end

class Battleship
  def initialize p1, p2
    @p1, @p2 = p1, p2
  end

  def take_turn player, opponent
    system "clear"
    puts "\n\n\n\t\t\t#{player.name}'s Turn"
    gets
    system "clear"

    row, col = player.get_move opponent.board

    if oppenent.was_hit? row, col
      puts "Hit!"
    else
      puts "Miss!"
    end

    gets
  rescue KeyError
    puts "Invalid move"
  end

  def play_round
    take_turn @p1, @p2
    return if @p2.sunk?
    take_turn @p2, @p1
  end

  def winner
    if @p2.sunk?
      @p1
    elsif @p1.sunk?
      @p2
    end
  end
end

p1, p2 = [1,2].map do |n|
  print "Player #{n}'s name > "
  p = Player.new gets.chomp
  p.place_ships
  system "clear"
  p
end

game = Battleship.new p1, p2
game.play_round until game.winner
