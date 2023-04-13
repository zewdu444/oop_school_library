module PersonDisplay
  def create_person
    person_type = person_type_switch
    case person_type
    when '1'
      print 'classroom: '
      classroom = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      classroom = Classroom.new(classroom)
      Student.new(classroom, age, name, parent_permission: parent_permission)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp

      Teacher.new(age, specialization, name)
    end

    @people << person
    puts 'Person created successfully'
  end

  def person_type_switch
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end
    person_type
  end
end
