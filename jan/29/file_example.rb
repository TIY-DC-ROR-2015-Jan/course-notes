def count_letters str
	# build up a hash of counts
	# look at each char in str in turn
	# either set count 1 if first seen
	# or update count if not

	# could use ~
	# counts = Hash.new(0)
	counts = {}

	str.downcase.each_char do |letter|
		counts[letter] ||= 0
		counts[letter]  += 1
	end

	counts
end

string = "This is a test string to count!!!"
contents = File.read("file_to_read.txt")

num_chars = contents.chars.count
num_lines = contents.lines.count
puts "This file contains #{num_lines} lines and #{num_chars} characters"

puts count_letters(contents)