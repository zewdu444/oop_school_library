require_relative 'decorator'
# TrimmerDecorator class
class TrimmerDecorator < Decorator
  def correct_name
    long_name = nameable.correct_name
    long_name.length > 10 ? long_name[0...10] : long_name
  end
end
