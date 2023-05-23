class Menu
  def print_menu
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1) List all books'
    puts '2) List all people'
    puts '3) Create a person'
    puts '4) Create a book'
    puts '5) Create a rental'
    puts '6) List rentals for a given person ID'
    puts '7) Quit'
    print 'Select an option: '
  end

  def getoption
    gets.chomp.to_i
  end
end
