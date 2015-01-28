require "minitest/autorun"
require 'pry'

#assumes finding all words from set of 3-letter-set
# Capital is a constant
#Dictionary = ["cat", "at", "bat", "act", "a", "ta"]

# Build up dictionary from reading in file /usr/share/dict/words
Dictionary = []
File.open("/usr/share/dict/words").each_line do |line|
  line.chomp! # remove \n from line
  if line.length >= 2 && line.length <= 7
    Dictionary.push line
  end
end

def possible_words letters
  possibilities = []
  combinations = letters.permutation.to_a + letters.permutation(2).to_a + letters.permutation(1).to_a
  combinations.each  do  |x|
    possibilities.push(x.join)
  end
  return possibilities
end

def word_finder letters_to_try
  results = []
  possible_words(letters_to_try).each do |x|
    if Dictionary.include?(x)
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
    assert found_words.length >= 5
    assert found_words.include?("act")
    assert !found_words.include?("bat")
  end

  def test_with_a_b
    found_words = word_finder(["t","b","a"])
    assert found_words.include?("bat")
  end
end