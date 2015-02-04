class Hangman
  attr_reader :guesses_left

  Words = File.
    read("/usr/share/dict/words").
    split("\n").
    select { |w| w.length < 8 && w.length > 1 }.
    map { |w| w.chomp }

  def initialize answer=nil
    @guesses_left = 6
    @answer = answer || Words.sample
  end

  def check_guess guess
    unless @answer.include? guess
      @guesses_left -= 1
    end
  end

  # def guesses_left
  #   @guesses_left
  # end
end