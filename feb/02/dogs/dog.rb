class Dog
	def initialize name, person_who_owns=nil
		@name = name
		@owner = person_who_owns
	end

  # attr_reader :name
	def name
		@name
	end

	def owner
		@owner
	end

	def bark!
		"Woof! Woof! My name is #{@name}!"
	end
end