require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'

class App
  def initialize
    @classrooms = []
    @books = []
    @rentals = []
    @people = []
  end

  def run
    puts 'Welcome to School Library OOP App!'
    puts '----------------------------------'

    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      option = gets.chomp

      case option
      when '1'
       if(@books.length == 0)
          puts 'There are no books in the library'
       else
        list_books
       end

      when '2'
        if(@people.length == 0)
          puts 'There are no people in the library'
        else
        list_people
        end
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        if(@rentals.length == 0)
          puts 'There are no rentals in the library'
        else
        list_rentals_for_person_id
        end
      end

      break if option == '7'
    end

    puts 'Thank you for using this app!'
  end

  private

  def list_books
    @books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    person =
      case person_type
      when '1'
        print 'classroom: '
        classroom = gets.chomp
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        if(parent_permission == 'y')
          parent_permission = true
        else
          parent_permission = false
        end
        classroom = Classroom.new(classroom)
        Student.new(classroom, age, name, parent_permission:parent_permission)
      when '2'
        print 'Specialization: '
        specialization = gets.chomp

        Teacher.new(age, specialization, name)
      end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end
  def create_rental
    if(@books.length == 0)
      puts 'There are no books in the library to rent'
      return
    end
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts
    if(@people.length == 0)
      puts 'There are no people in the library to rent'
      return
    end
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end
  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
