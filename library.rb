require_relative './modules/create_entity'
require_relative './modules/display_entity'

class Library
  include CreateEntity
  include DisplayEntity

  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def save_new_person(person)
    @all_people << person
  end

  def save_new_book(book)
    @all_books << book
  end

  def save_rental(rental)
    @all_rentals << rental
  end
end
