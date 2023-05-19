require_relative 'models/student'
require_relative 'models/teacher'
require_relative 'models/book'
require_relative 'models/rental'

module CreateEntity
  def create_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      person_type = gets.chomp
      if (1..2).include?(person_type.to_i)
        check_person_type(person_type)
        break
      end
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    permission = ''
    loop do
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      break if %w[n y].include? permission.downcase
    end

    new_student = Student.new(age, name: name, parent_permission: permission)
    save_new_people(new_student)
    puts "New person (Student) created successfully!\n\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(age, specialization, parent_permission: true, name: name)
    save_new_people(new_teacher)
    puts "New person (Teacher) created successfully!\n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    new_book = Book.new(title: title, author: author)
    save_new_book(new_book)
    puts "New book created successfully!\n\n"
  end

  def check_person_type(person_type)
    case person_type.to_i
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_rental
    return puts "No books available!\n\n" if @all_books.empty?

    select_book_option = select_book
    return if select_book_option.nil?

    return puts "No person info available!\n\n" if @all_people.empty?

    select_person_option = select_person
    return if select_person_option.nil?

    print 'Date: '
    date = gets.chomp

    new_rental = Rental.new(
      date: date,
      book: @all_books[select_book_option.to_i],
      person: @all_people[select_person_option.to_i]
    )
    save_rental(new_rental)

    puts "New rental created successfully!\n\n"
  end

  def select_book
    puts 'Select a book from the following list by number: '

    loop do
      list_books_with_options
      select_book_option = gets.chomp

      return select_book_option.to_i unless @all_books[select_book_option.to_i].nil?

      puts "Selected book does not exist!\n\n"
    end
  end

  def select_person
    puts 'Select a person from the following list by number (not id): '

    loop do
      list_person_with_options
      select_person_option = gets.chomp

      return select_person_option.to_i unless @all_people[select_person_option.to_i].nil?

      puts "Selected person does not exist!\n\n"
    end
  end

  module DisplayEntity
    def list_all_books
      if @all_books.empty?
        puts "No books available!\n\n"
      else
        @all_books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
        puts "\n\n"
      end
    end

    def list_all_people
      if @all_people.empty?
        puts "No person info available!\n\n"
      else
        @all_people.each do |person|
          puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        puts "\n"
      end
    end

    def list_books_with_options
      @all_books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      puts "\n"
    end

    def list_person_with_options
      @all_people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      puts "\n"
    end

    def list_person_rentals
      if @all_rentals.empty?
        puts "No rentals available!\n\n"
      else
        print 'ID of the person: '
        person_id = gets.chomp
        puts 'Rentals:'

        selected_rentals = @all_rentals.select do |rental|
          rental.person.id.to_i == person_id.to_i
        end

        if selected_rentals.empty?
          puts "No rentals for this person!\n\n"
        else
          selected_rentals.each do |rental|
            puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
          end
          puts "\n"
        end
      end
    end
  end

  class App
    include CreateEntity
    include DisplayEntity

    def initialize
      @all_books = []
      @all_people = []
      @all_rentals = []
    end

    def run
      loop do
        print_menu
        option = gets.chomp.to_i
        puts "\n"
        process_option(option)
        break if option == 7
      end
    end

    def process_option(option)
      case option
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_person_rentals
      else
        puts "Invalid option! Please choose a valid option.\n\n"
      end
    end

    private

    def save_new_people(person)
      @all_people << person
    end

    def save_new_book(book)
      @all_books << book
    end

    def save_rental(rental)
      @all_rentals << rental
    end

    def print_menu
      puts 'Welcome to School Library App!'
      puts
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
  end

  app = App.new
  app.run
end
