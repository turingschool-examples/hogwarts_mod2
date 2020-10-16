require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/students'" do
    it "I see a list of students and the number 
    of professors each student has." do 
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

        hermione = Student.create!(
          name: "Hermione",
          age: 15,
          house: "Gryffindor",
        )

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

        ProfessorStudent.create!(
          professor_id: lupin.id,
          student_id: hermione.id
        )

        visit "/students"

        save_and_open_page

        expect(page).to have_content("Malfoy: 1")
        expect(page).to have_content("Ron: 2")
        expect(page).to have_content("Harry: 2")
        expect(page).to have_content("Hermione: 1")
    end
  end
end 