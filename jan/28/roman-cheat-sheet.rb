require 'roman-numerals'

%w( I II IV IX MCMVII).each do |num|
	puts RomanNumerals.to_decimal num
end