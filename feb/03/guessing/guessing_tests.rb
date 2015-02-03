require 'minitest/autorun'

require './game'

class GuessingTests < MiniTest::Test
	def test_it_knows_guesses_left
		g = Game.new
		assert_equal g.guesses_left, 6
	end
end