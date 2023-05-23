require_relative './modules/create_entity'
require_relative './modules/display_entity'
require_relative 'library'
require_relative 'menu'

class App
  def initialize
    @library = Library.new
    @menu = Menu.new
  end

  def run
    loop do
      @menu.print_menu
      option = @menu.getoption
      puts "\n"
      break if option == 7

      process_option(option)
    end

    puts 'Thank you for using School Library 😊'
  end

  def process_option(option)
    case option
    when 1
      @library.list_all_books
    when 2
      @library.list_all_people
    when 3
      @library.create_person
    when 4
      @library.create_book
    when 5
      @library.create_rental
    when 6
      @library.list_person_rentals
    else
      puts "Invalid option! Please choose a valid option.\n\n"
    end
  end
end
