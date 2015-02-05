require './cell'

class Grid
  def initialize row, col
  end

  def take_turn!
  end

  def to_s
  end
end

if $PROGRAM_NAME == __FILE__
  grid = Grid.new 3, 3

  1000.times
    puts grid.to_s
    grid.take_turn!
  end
end