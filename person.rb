class Nameable
  def correct_name
    raise NotImplementedError, 'Implement the correct_name method.'
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end
end
