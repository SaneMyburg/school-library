require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  @all = []

  def initialize(date:, person:, book:)
    @date = date
    @person = person
    @book = book
    self.class.all << self
  end

  def self.all
    @all
  end
end
