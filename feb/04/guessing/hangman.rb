class Hangman
  attr_reader :guesses_left

  Words = File.
    read("/usr/share/dict/words").
    split("\n").
    select { |w| w.length < 8 && w.length > 1 }.
    map { |w| w.chomp }

  def initialize answer=nil
    @guesses_left = 6
    @guesses = []
    @answer = answer || Words.sample
  end

  def check_guess guess
    @guesses.push guess
    unless @answer.include? guess
      @guesses_left -= 1
    end
  end

  def board
    result = ""
    @answer.split("").each do |letter|
      if @guesses.include? letter
        result += letter
      else
        result += "_"
      end
    end
    result
  end

  def lost?
    @guesses_left == 0
  end

  # def guesses_left
  #   @guesses_left
  # end
end