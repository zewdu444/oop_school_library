# Person class
require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id ,:nameable

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
 def correct_name
     nameable
 end
  private :of_age?
end
