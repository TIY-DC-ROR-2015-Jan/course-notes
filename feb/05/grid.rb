require './cell'

require 'pry'

class Grid
  def initialize row_count, col_count
    @board = []
    row_count.times do
      row = []
      col_count.times do
        cell = Cell.new
        cell.revive! if rand < 0.4
        row.push cell
      end
      @board.push row
    end
  end

  def display
    @board.each do |row|
      display_row row
      puts ""
    end
  end

  def display_row row
    row.each do |cell|
      if cell.alive?
        print "X"
      else
        print " "
      end
    end
  end

  def take_turn!
  end
end

if $PROGRAM_NAME == __FILE__
  grid = Grid.new 3, 3

  #1000.times do
    grid.display
    grid.take_turn!
  #end
end