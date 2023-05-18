require_relative 'book'

class Rental
  attr_accessor :date, :person
  attr_reader :book

  @@all = []

  def initialize(date:, person:, book:)
    @date = date
    @person = person
    @book = book
    @@all << self
  end

  def self.all
    @@all
  end

  def book=(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end
end

