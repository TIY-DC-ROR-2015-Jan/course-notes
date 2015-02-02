class Person
  def initialize name_passed_in_during_new
    # need to store this as an instance
    #   variable to refer to later
    @remembered_name = name_passed_in_during_new
  end

  def name
    # Can't say `name_passed_in_during_new`
    @remembered_name
  end
end