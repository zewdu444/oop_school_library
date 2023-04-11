require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
person = Person.new(18, 'zewdu erkyhun')
p person.correct_name
p capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
p capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
p capitalized_trimmed_person.correct_name
