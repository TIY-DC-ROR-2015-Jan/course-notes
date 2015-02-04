require 'minitest/autorun'

require './hangman'

class HangmanTests < MiniTest::Test
  def test_it_knows_guesses_left
    h = Hangman.new
    assert_equal h.guesses_left, 6
  end

  def test_it_counts_off_on_misses
    h = Hangman.new "banana"
    h.check_guess "c"
    assert_equal h.guesses_left, 5
  end

  def test_it_doesnt_count_off_for_correct
    h = Hangman.new "banana"
    h.check_guess "a"
    assert_equal h.guesses_left, 6
  end
end