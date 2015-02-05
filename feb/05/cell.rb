class Cell
  attr_reader :neighbors

  def initialize
    @alive = false
    @neighbors = []
  end

  def take_turn!
    living_neighbors = neighbors.count { |n| n.alive? }
    if living_neighbors < 2
      @alive = false
    end
  end

  def revive!
    @alive = true
  end

  def dead?
    ! @alive
  end

  def alive?
    @alive
  end
end