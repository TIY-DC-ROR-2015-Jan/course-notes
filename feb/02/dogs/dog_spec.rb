require "minitest/autorun"

require_relative "./person"

class TestAllTheThings < Minitest::Test
  def test_people_know_their_name
    person = Person.new "james"
    assert_equal "james", person.name
  end
end