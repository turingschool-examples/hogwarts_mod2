require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have." do
        
        snape = Professor.create!(
          name: "Severus Snape",
          age: 44,
          specialty: "Potions"
        )

        lupin = Professor.create!(
          name: "Remus Lupin",
          age: 38,
          specialty: "Defense Against the Dark Arts"
        )

        malfoy = Student.create!(
          name: "Malfoy",
          age: 14,
          house: "Slytherin",
        )

        ron = Student.create!(
          name: "Ron",
          age: 14,
          house: "Gryffindor",
        )

        harry = Student.create!(
          name: "Harry",
          age: 15,
          house: "Gryffindor",
        )

        ProfessorStudent.create!(
          professor_id: snape.id,
          student_id: malfoy.id
        )
        
        ProfessorStudent.create!(
          professor_id: snape.id,
          student_id: harry.id
        )
        
        ProfessorStudent.create!(
          professor_id: snape.id,
          student_id: ron.id
        )

        ProfessorStudent.create!(
          professor_id: lupin.id,
          student_id: harry.id
        )

        ProfessorStudent.create!(
          professor_id: lupin.id,
          student_id: ron.id
        )

        visit "/professors/#{snape.id}"

        expect(page).to have_content("Malfoy")
        expect(page).to have_content("Ron")
        expect(page).to have_content("Harry")
    end 
  end
end 