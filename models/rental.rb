require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  @all = []

  class << self
    attr_reader :all
  end

  def initialize(date:, person:, book:)
    @date = date
    @person = person
    @book = book
    self.class.all << self
  end
end
