require 'minitest/autorun'

require './hangman'

class HangmanTests < MiniTest::Test
  def test_it_knows_guesses_left
    h = Hangman.new
    assert_equal h.guesses_left, 6
  end
end