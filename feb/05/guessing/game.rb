class Game
  def initialize options
    @high = options[:high] || 100
    @low  = options[:low] || 1
    @guesses_left = options[:guesses] || 6
    @answer = rand @low .. @high
    @got_it = false
    puts "Guessing from #{@low} up to #{@high}, #{@guesses_left} chances"
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