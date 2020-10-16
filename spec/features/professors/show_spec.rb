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

      expect(page).to have_content(snape.name)

      within ".students" do
        expect(page.all('li')[0]).to have_content(malfoy.name)
        expect(page.all('li')[1]).to have_content(harry.name)
        expect(page.all('li')[2]).to have_content(longbottom.name)
      end
    end

    it "I see the average age of all students" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      digory = Student.create(name: "Cedric Digory" , age: 14 , house: "Huffle Puff" )
      chang = Student.create(name: "Cho Chang" , age: 13 , house: "Ravenclaw" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: digory.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: chang.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      expect(page).to have_content("Average Age: 12.2")
    end
  end
end
