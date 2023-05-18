require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :age, :classroom, :name, :parent_permission

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
  end

  def add_student(student)
    students << student
    student.classroom = self
    self.students << student
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
