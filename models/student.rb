require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :age, :classroom, :name, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
     super(age, name: name, parent_permission: parent_permission)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def classroom_details
    @classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

class_a = Classroom.new(label: 'class A')
class_b = Classroom.new(label: 'class B')

student1 = Student.new(12, name: 'Sipho')
student2 = Student.new(15, name: 'Lubanzi')

class_b.add_student(student2)

student1.assign_classroom(class_a)

class_a.students.each { |student| puts student.name }

puts student1.classroom_details.label
