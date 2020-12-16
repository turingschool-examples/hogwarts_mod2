require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the professor show page' do

    it 'I see a list of all the names of the students a professor has' do
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)

      visit "/professor/#{lupin.id}"

      expect(page).to have_content(harry.name)
      expect(page).to have_content(malfoy.name)

    end
  end
end