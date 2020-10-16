require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit '/professors/:id'" do
    it "I see a list of their students listed in alphabetical order" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      within ".students" do
        expect(page.all('li')[0]).to have_content(malfoy.name)
        expect(page.all('li')[1]).to have_content(harry.name)
        expect(page.all('li')[2]).to have_content(longbottom.name)
      end

    end
  end
end
