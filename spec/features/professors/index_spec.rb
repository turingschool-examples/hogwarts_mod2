require 'rails_helper'

RSpec.describe "As a visitor," do 
  describe "when I visit '/professors'" do 
    it "I see a list of professors with their name/age/speciality." do

snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)


  visit '/professors'
save_and_open_page
      expect(page).to have_content("Severus Snape")
      expect(page).to have_content(45)
      expect(page).to have_content("Potions")
      expect(page).to have_content("Rubeus Hagrid")
      expect(page).to have_content(38)
      expect(page).to have_content("Care of Magical Creatures")
      expect(page).to have_content("Remus Lupin")
      expect(page).to have_content(49)
      expect(page).to have_content("Defense Against The Dark Arts")

    end
  end
end
