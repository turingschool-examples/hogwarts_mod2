require "rails_helper"

describe 'As a visitor' do
  describe 'When I visit /students' do
    it 'Has a list of students and the number of professors each has' do
      professor_1 = Professor.create(name: 'Severus Snape', age: '45', specialty: 'Potions')
      professor_2 = Professor.create(name: 'Rubeus Hagrid', age: '38', specialty: 'Care of Magical Creatures')
      professor_3 = Professor.create(name: 'Remus Lupin', age: '49', specialty: 'Defense Against The Dark Arts')
      student_1 = Student.create(name: 'Harry Potter', age: '11', house: 'Gryffindor')
      student_2 = Student.create(name: 'Draco Malfoy', age: '12', house: 'Slytherin')
      ProfessorStudent.create(professor_id: professor_1.id, student_id: student_1.id)
      ProfessorStudent.create(professor_id: professor_2.id, student_id: student_1.id)
      ProfessorStudent.create(professor_id: professor_3.id, student_id: student_1.id)
      ProfessorStudent.create(professor_id: professor_2.id, student_id: student_2.id)
      ProfessorStudent.create(professor_id: professor_3.id, student_id: student_2.id)

      visit '/students'
      expect(page).to have_content("#{student_1.name}: 3")
      expect(page).to have_content("#{student_2.name}: 2")
    end
  end
end
