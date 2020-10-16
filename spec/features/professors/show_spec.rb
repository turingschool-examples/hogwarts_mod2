# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#      "Hermione Granger"
#      "Luna Lovegood")

# User Story 4 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see the average age of all students for that professor.
# (e.g. "Average Age: 14.5")

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the '/professors/:id' path" do
    it "can see a list of student names taught by that professor" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      expect(page).to have_content("#{harry.name}")
      expect(page).to have_content("#{malfoy.name}")
      expect(page).to have_content("#{longbottom.name}")
    end

    it "can see the average age of all students taught by that professor" do
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)

      visit "/professors/#{hagarid.id}"
    save_and_open_page
      expect(page).to have_content("Average Age of Students: 11.5")
    end
  end
end
