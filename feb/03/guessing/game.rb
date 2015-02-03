class Game
	def initialize
		@guesses_left = 6
		@answer = rand 1 .. 100
	end

	attr_reader :guesses_left, :answer

	# def guesses_left
	# 	@guesses_left
	# end
	# def answer
	# 	@answer
	# end

	def check_guess n
		@guesses_left -= 1
		if n > @answer # guess was high
			"Your guess was too high"
		elsif n < @answer # guess was log
			"Your guess was too low"
		else
			"You got it!"
		end
	end
end