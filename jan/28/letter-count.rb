puts "Please type a string to analyze."
input = gets.chomp

puts "You typed in: #{input}"

letters = input.split("")
result = {}

letters.each do |letter|
	# see if the letter is already in result
	# if so increment count
	# if not, add it to the hash and set count to 1

	# VVVV

	# if # letter is in result
	#   # increment count for that letter by 1
	# else
	#   # add to result with count 1
	# end

	# VVVV

	# could use result.has_key? or result.include?
	if result[letter]
	  # increment count for that letter by 1
	  # result[letter] += 1
	  old_count = result[letter]
	  result[letter] = old_count + 1
	else
	  # add to result with count 1
		result[letter] = 1
	end
end

puts "Result is: #{result}"