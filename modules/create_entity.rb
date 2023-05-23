require_relative '../models/student'
require_relative '../models/teacher'
require_relative '../models/book'
require_relative '../models/rental'

module CreateEntity
  def create_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      person_type = gets.chomp
      if (1..2).include?(person_type.to_i)
        create_person_by_type(person_type.to_i)
        break
      end
    end
  end

  def create_person_by_type(person_type)
    case person_type
    when 1
      create_student
    when 2
      create_teacher
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
    save_new_person(new_student)
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
    save_new_person(new_teacher)
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
end
