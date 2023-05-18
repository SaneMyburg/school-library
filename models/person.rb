require_relative 'nameable'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def books
    rentals.map(&:book)
  end

  def add_rental(rental)
    rental.person = self
  end
end

person = Person.new(22, name: 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

person1 = Person.new(32, name: 'Heldain', parent_permission: true)
person2 = Person.new(20, name: 'Zoe', parent_permission: true)

book1 = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
book2 = Book.new(title: 'To Kill a Mockingbird', author: 'Harper Lee')

rental1 = Rental.new(date: '2023-05-11', book: book1, person: person1)
rental2 = Rental.new(date: '2023-05-19', book: book2, person: person2)

person1.add_rental(rental1)
person2.add_rental(rental2)

book1.add_rental(rental1)
book2.add_rental(rental2)

puts rental1.person.name
puts rental2.person.name

puts person1.rentals.count
puts person2.rentals.count

person1.rentals.each { |rental| puts rental.book.title }
person2.rentals.each { |rental| puts rental.book.title }

book1.rentals.each { |rental| puts "#{rental.book.title} was rented by #{rental.person.name}" }
book2.rentals.each { |rental| puts "#{rental.book.title} was rented by #{rental.person.name}" }
