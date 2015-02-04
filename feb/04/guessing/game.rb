class Game
  def initialize
    @guesses_left = 6
    @answer = rand 1 .. 100
    @got_it = false
  end

  attr_reader :guesses_left, :answer

  # def guesses_left
  #   @guesses_left
  # end
  # def answer
  #   @answer
  # end

  def lost?
    @guesses_left <= 0
  end

  def won?
    @got_it
  end

  def over?
    won? || lost?
  end

  def check_guess n
    if n > @answer # guess was high
      @guesses_left -= 1
      "Your guess was too high"
    elsif n < @answer # guess was log
      @guesses_left -= 1
      "Your guess was too low"
    else
      @got_it = true
      "You got it!"
    end
  end
end