require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit /students' do
    it 'I see a list of students and their number of professors' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)

      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)


      visit '/students'

      expect(page).to have_content("#{malfoy.name}: 2")
      expect(page).to have_content("#{longbottom.name}: 1")
    end
  end
end
