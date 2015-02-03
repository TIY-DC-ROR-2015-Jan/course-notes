require 'minitest/autorun'

require './game'

class GuessingTests < MiniTest::Test
	def test_it_knows_guesses_left
		g = Game.new
		assert_equal g.guesses_left, 6
	end

	def test_it_has_picked_an_answer
		g = Game.new
		assert g.answer.is_a? Integer
	end

	def test_lets_you_know_if_you_guessed_high
		g = Game.new
		response = g.check_guess 101
		assert_equal "Your guess was too high", response
		assert_equal g.guesses_left, 5
	end

	def test_that_you_can_win
		g = Game.new
		response = g.check_guess g.answer
		assert_equal response, "You got it!"
	end

	def test_that_you_can_lose
		g = Game.new
		6.times { g.check_guess 101 }
    assert g.lost?
	end
end