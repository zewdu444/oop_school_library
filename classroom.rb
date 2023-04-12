class Classroom
  has_many :students, :dependent => :destroy
  def initialize(label)
    @label = label
  end
  def add_student(student)
    @students.push(student)
  end
end
