require "minitest/autorun"

require_relative "./person"
require_relative "./dog"

class TestAllTheThings < Minitest::Test
  def test_people_know_their_name
    person = Person.new "james"
    assert_equal "james", person.name
  end

  def test_dogs_know_their_name
    dog = Dog.new "rufus"
    assert_equal "rufus", dog.name
  end
end