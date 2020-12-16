require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the index page' do
    it 'I see all the students and the number of professors each has' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/students"
      
      expect(page).to have_content(harry.name)
      expect(page).to have_content("3")
      expect(page).to have_content(longbottom.name)
      expect(page).to have_content("1")
   
    end
  end
end