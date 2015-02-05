class Cell
  attr_reader :neighbors

  def initialize
    @alive = false
    @neighbors = []
  end

  def decide
    living_neighbors = neighbors.count { |n| n.alive? }
    if living_neighbors < 2
      @next_time = false
    elsif living_neighbors > 3
      @next_time = false
    elsif living_neighbors == 3 && dead?
      @next_time = true
    end
  end

  def update!
    @alive = @next_time
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