require 'pry'

contents = File.read "numbers.txt"

count = 0
lines = contents.split "\n"
lines.each do |line|
	numbers_in_line = line.split ","
	numbers_in_line.each do |n|
		count = count + n.to_i
	end
end

puts "Answer is: #{count}"