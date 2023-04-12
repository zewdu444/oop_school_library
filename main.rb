require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'

# create a classsroom
 comp_1 = Classroom.new('Computer Science')
#  create a student one
student_one = Student.new(comp_1, 18, 'Minilik', parent_permission: true)
# create a student two
student_two = Student.new(comp_1, 18, 'zewdu', parent_permission: true)
# create a teacher
teacher_one = Teacher.new(comp_1, 30, 'Mulu')

# create a book
book_one = Book.new('The Alchemist', 'Paulo Coelho')
# create a book
book_two = Book.new('Atomic Habit', 'James Clear')
# create a rental
rental_one = Rental.new('4-12-2023',book_one, student_one)
# create a rental
rental_two = Rental.new('4-11-2023',book_two, student_two)
# create a rental
rental_three = Rental.new('4-11-2023',book_one, teacher_one)

p "library books rental details are as follows"
p '------------------------------------------'
p "1. rental name #{rental_one.person.name}  book #{rental_one.book.title} date of rental #{rental_one.date}"
p "2. rental name #{rental_two.person.name}   book #{rental_two.book.title} date of rental #{rental_two.date}"
p "3. rental name #{rental_three.person.name} book #{rental_three.book.title} date of rental #{rental_three.date}"



