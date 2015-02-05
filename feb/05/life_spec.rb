require "minitest/autorun"

require "./cell"

class LifeTest < MiniTest::Test
  def test_a_cell_starts_off_dead
    c = Cell.new
    assert c.dead?
    refute c.alive?
  end

  def test_a_cell_knows_about_its_neighbors
    c = Cell.new
    assert_equal c.neighbors, []
    c.neighbors.push Cell.new
    assert_equal c.neighbors.length, 1
  end

  def test_a_cell_dies_through_starvation
    c = Cell.new
    c.revive!
    assert c.alive?

    # c has 1 neighbor that's alive
    d = Cell.new
    d.revive!
    c.neighbors.push d

    c.take_turn!
    assert c.dead?
  end

  def test_cells_die_from_overcrowding
    c = Cell.new
    c.revive!

    4.times do
      d = Cell.new
      d.revive!
      c.neighbors.push d
    end

    c.take_turn!
    assert c.dead?
  end

  def test_cells_revive_sometimes
    c = Cell.new
    assert c.dead?

    3.times do
      d = Cell.new
      d.revive!
      c.neighbors.push d
    end

    c.take_turn!
    assert c.alive?
  end
end