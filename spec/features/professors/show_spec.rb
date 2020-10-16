require "rails_helper"

describe 'As a visitor' do
  describe 'When I visit /professors/:id' do
    it 'I see a list of the names of the students the professor has' do
      professor = Professor.create(name: 'Severus Snape', age: '45', specialty: 'Potions')
      student_1 = Student.create(name: 'Harry Potter', age: '11', house: 'Gryffindor')
      student_2 = Student.create(name: 'Neville Longbottom', age: '11', house: 'Gryffindor')
      ProfessorStudent.create(professor_id: professor.id, student_id: student_1.id)
      ProfessorStudent.create(professor_id: professor.id, student_id: student_2.id)

      visit "/professors/#{professor.id}"

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end
