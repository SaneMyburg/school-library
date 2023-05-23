require_relative 'app'

class AppRunner
  def self.run
    app = App.new
    app.run
  end
end

AppRunner.run


# class App
#   include CreateEntity
#   include DisplayEntity

#   def initialize
#     @all_books = []
#     @all_people = []
#     @all_rentals = []
#   end

#   def run
#     loop do
#       print_menu
#       option = gets.chomp.to_i
#       puts "\n"
#       process_option(option)
#       break if option == 7
#     end
#   end

#   OPTION_ACTIONS = {
#     1 => :list_all_books,
#     2 => :list_all_people,
#     3 => :create_person,
#     4 => :create_book,
#     5 => :create_rental,
#     6 => :list_person_rentals,
#     7 => :quit
#   }.freeze

#   def process_option(option)
#     action = OPTION_ACTIONS[option]
#     if action
#       send(action)
#     else
#       puts "Invalid option! Please choose a valid option.\n\n"
#     end
#   end

#   def quit
#     puts 'Thank you for using School Library 😊'
#   end

#   private

#   def save_new_people(person)
#     @all_people << person
#   end

#   def save_new_book(book)
#     @all_books << book
#   end

#   def save_rental(rental)
#     @all_rentals << rental
#   end

  # def print_menu
  #   puts 'Welcome to School Library App!'
  #   puts ''
  #   puts 'Please choose an option by entering a number:'
  #   puts '1) List all books'
  #   puts '2) List all people'
  #   puts '3) Create a person'
  #   puts '4) Create a book'
  #   puts '5) Create a rental'
  #   puts '6) List rentals for a given person ID'
  #   puts '7) Quit'
  #   print 'Select an option: '
  # end
# end

# app = App.new
# app.run
