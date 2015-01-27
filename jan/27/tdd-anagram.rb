require "minitest/autorun"
# require "minitest/reporters"

# reporter_options = { color: true }
# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

def is_anagram? arr1, arr2
  arr1.sort == arr2.sort
end

class TestAnagram < Minitest::Test
  def test_it_can_work
    assert is_anagram? [:c,:a,:t], [:a,:c,:t]
  end

  def test_it_checks_more_than_length
    # assert !is_anagram?
    refute is_anagram? [:c,:a,:t], [:b,:a,:t]
  end

  def test_singleton_array
    assert is_anagram? [:a], [:a]
  end

  def test_random_array
    original = [1,2,3,4,5]
    shuffled = original.shuffle
    assert is_anagram? original, shuffled
  end
end