require_relative 'rental'

class Book
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
  end

  def rentals
    Rental.all.select { |rental| rental.book == self }
  end

  def people
    rentals.map(&:person)
  end

  def add_rental(rental)
    rental.book = self
  end
end
