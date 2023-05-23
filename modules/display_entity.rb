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
    @all_books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
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

      selected_rentals = @library.all_rentals.select do |rental|
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
