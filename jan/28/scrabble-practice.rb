require "minitest/autorun"
require 'pry'

#assumes finding all words from set of 3-letter-set

def possible_words letters
  possibilities = []
  combinations = letters.permutation.to_a + letters.permutation(2).to_a + letters.permutation(1).to_a
  combinations.each  do  |x|
    possibilities.push(x.join)
  end
  return possibilities
end

def word_finder letters_to_try
  # %w(cat at bat act a ta)
  dictionary = ["cat", "at", "bat", "act", "a", "ta"]
  results = []
  possible_words(letters_to_try).each do |x|
    if dictionary.include?(x)
      results.push(x)
    end
  end
  return results
end

class TestScrabble < Minitest::Test
  def test_possible_words
    possibilites = possible_words(["c","a","t"])
    assert possibilites.include?("tca")
  end
  
  def test_is_string
    found_words = word_finder(["c","a","t"])
    assert_equal found_words.length, 5
    assert found_words.include?("act")
    assert !found_words.include?("bat")
  end

  def test_with_a_b
    found_words = word_finder(["t","b","a"])
    assert found_words.include?("bat")
  end
end