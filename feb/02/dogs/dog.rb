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
end