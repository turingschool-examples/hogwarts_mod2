require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "lists that professor's students' names" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit("/professors")

      click_link("#{snape.name}'s Students")

      expect(current_path).to eq("/professors/#{snape.id}")
      expect(page).to have_content("#{snape.name}'s Students")
      expect(page).to have_content("#{harry.name}")
      expect(page).to have_content("#{longbottom.name}")
    end
  end
end
