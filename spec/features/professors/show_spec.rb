require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "lists that professor's students' names" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)

      visit("/professors")

      click_link("#{snape.name}'s Students")

      expect(current_path).to eq("/professors/#{snape.id}")
      expect(page).to have_content("#{snape.name}'s Students")
      expect(page).to have_content("#{harry.name}")
      expect(page).to have_content("#{longbottom.name}")
      expect(page).to_not have_content("#{malfoy.name}")
      expect(page).to_not have_content("#{lupin.name}")
    end
  end
end
