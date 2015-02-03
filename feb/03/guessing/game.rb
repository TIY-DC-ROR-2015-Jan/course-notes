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
end