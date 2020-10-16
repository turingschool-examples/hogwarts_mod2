require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit '/professors/:id'," do
    it "I see a list of the names of the students the professors have." do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.name)
    end
  end
  it "I see the average age of all students for that professor." do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/professors/#{snape.id}"

      expect(page).to have_content("Average Age: #{snape.student_average_age}")
  end
end