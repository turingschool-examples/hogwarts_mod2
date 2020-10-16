require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit '/students'" do
    it "I see a list of students in alphabetical order and the number of professors they have" do

      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      trelawney = Professor.create(name: "Sybill Trelawney", age: 41 , specialty: "Divination")
      dumbledore = Professor.create(name: "Albus Dumbledore", age: 102, specialty: "Everything")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      granger = Student.create(name: "Hermione Granger" , age: 11 , house: "Gryffindor" )
      luna = Student.create(name: "Luna Lovegood" , age: 11 , house: "Ravenclaw" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: dumbledore.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: trelawney.id)
      ProfessorStudent.create(student_id: luna.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: luna.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: luna.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: trelawney.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: dumbledore.id)

      visit "/students"

      within ".students" do
        expect(page.all('.student')[0]).to have_content(malfoy.name)
        expect(page.all('.student')[1]).to have_content(harry.name)
        expect(page.all('.student')[2]).to have_content(granger.name)
        expect(page.all('.student')[3]).to have_content(luna.name)
        expect(page.all('.student')[4]).to have_content(longbottom.name)
      end

      within "#student-#{harry.id}" do
        expect(page).to have_content("#{harry.name}: 4")
      end

      within "#student-#{malfoy.id}" do
        expect(page).to have_content("#{malfoy.name}: 3")
      end

      within "#student-#{longbottom.id}" do
        expect(page).to have_content("#{longbottom.name}: 2")
      end

      within "#student-#{luna.id}" do
        expect(page).to have_content("#{luna.name}: 3")
      end

      within "#student-#{granger.id}" do
        expect(page).to have_content("#{granger.name}: 5")
      end

    end
  end
end
