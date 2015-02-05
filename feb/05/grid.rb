require './cell'

require 'pry'

class Grid
  def initialize row_count, col_count
    @row_count, @col_count = row_count, col_count
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
    update_neighbors!
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
    @board.each do |row|
      row.each do |cell|
        cell.take_turn!
      end
    end
  end

  def in_bounds? i,j
    i >= 0 && i < @row_count && j >= 0 && j < @col_count
  end

  def neighbors i,j
    [
      [i,j+1],
      [i,j-1],
      [i+1,j+1],
      [i+1,j-1],
      [i-1,j+1],
      [i-1,j-1],
      [i+1,j],
      [i-1,j]
    ].select { |a,b| in_bounds? a,b }
  end

  def update_neighbors!
    @row_count.times do |i|
      @col_count.times do |j|
        current_cell = @board[i][j]

        positions = neighbors(i,j)
        positions.each do |a,b|
          current_cell.neighbors.push @board[a][b]
        end
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  grid = Grid.new 40, 40

  10000.times do |i|
    system "clear"
    puts "Turn #{i}"
    grid.display
    grid.take_turn!
    sleep 0.1
  end
end