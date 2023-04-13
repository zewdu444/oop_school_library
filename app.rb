require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative './module/rental_module'
require_relative './module/person_module'
require_relative './module/book_module'
# App class

class App
  include RentalDisplay
  include PersonDisplay
  include BookDisplay
  def initialize
    @classrooms = []
    @books = []
    @rentals = []
    @people = []
  end

  def run
    loop do
      library_menu
      option = gets.chomp
      case option
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rentals_for_person_id
      end
      break if option == '7'
    end
    puts 'Thank you for using this app!'
  end

  def library_menu
    puts 'Welcome to School Library OOP App!'
    puts '----------------------------------'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
