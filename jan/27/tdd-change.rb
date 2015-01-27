require "minitest/autorun"
require "pry"

def make_change amount, coins=[25,10,5,1]
  # result = []
  # for each coin
  #   do some stuff
  #   add amt to result array
  # return result
  result = []
  number_of_cents = (amount * 100).to_i
  whats_left = number_of_cents

  # Old implementation
  # result[0] = number_of_cents / coins[0]
  # whats_left -= result[0] * coins[0]

  # result[1] = whats_left / coins[1]
  # whats_left -= result[1] * coins[1]

  # result[2] = whats_left / coins[2]
  # whats_left -= result[2] * coins[2]

  # result[3] = whats_left / coins[3]
  coins.each do |coin_value|
    amount_of_coin = whats_left / coin_value
    result.push amount_of_coin
    whats_left -= amount_of_coin * coin_value
  end

  result
end

class TestAnagram < Minitest::Test
  def test_31
    assert_equal make_change(0.31), [1,0,1,1] 
  end

  def test_130
    assert_equal make_change(1.30), [5,0,1,0]
  end

  def test_with_different_coins
    assert_equal make_change(1.01, [33,25,10,5,1]),
      [3,0,0,0,2]
  end
end