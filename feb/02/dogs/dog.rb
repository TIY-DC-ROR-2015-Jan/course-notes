class Dog
	def initialize name, person_who_owns=nil
		@name = name
		@owner = person_who_owns
		@hungry = true
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

	def happy?
		! hungry?
	end

	def hungry?
		@hungry
	end

	def get_fed!
		@hungry = false
	end
end