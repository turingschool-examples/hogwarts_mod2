require 'rails_helper'

# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#      "Hermione Granger"
#      "Luna Lovegood")

RSpec.describe "Professors Show:" do
  describe "As a visitor" do
    describe "When I visit 'professors/:id'" do
      it "I see a list of the names of the students that professor has" do
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        professors = [snape, hagrid, lupin]
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: hagrid.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

        professors.each do |professor|
          visit "/professors/#{professor.id}"

          professor.students.each do |student|
            within("#student-#{student.id}") do
              student.name
            end
          end
        end
      end
      it "I see the average age of all students for that professor" do
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        professors = [snape, hagrid, lupin]
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: hagrid.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

        professors.each do |professor|
          visit "/professors/#{professor.id}"

          within("#student-stats-#{professor.id}") do
            expect(page).to have_content("Average Age: #{professor.students.average(:age)}")
          end
        end
      end
    end
  end
end
