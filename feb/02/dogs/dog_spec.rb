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

  def test_dogs_know_their_owner
    james = Person.new "james"
    rufus = Dog.new "rufus", james
    assert_equal rufus.owner, james
    assert rufus.owner.is_a?(Person)
    assert_equal rufus.owner.name, "james"
  end

  def test_dogs_can_bark
    rufus = Dog.new "rufus"
    assert_equal rufus.bark!, "Woof! Woof! My name is rufus!"
  end

  def test_people_can_feed_dogs
    mason = Person.new "mason"
    sadie = Dog.new "sadie", mason
    mason.feed sadie
    assert sadie.happy? # assert_equal sadie.happy?, true
    refute sadie.hungry? # assert !sadie.hungry?
  end
end