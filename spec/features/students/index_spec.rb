require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit /students' do
    it 'I see a list of students and their number of professors' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)

      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)


      visit '/students'

      expect(page).to have_content("#{malfoy.name}: 2")
      expect(page).to have_content("#{longbottom.name}: 1")
    end

    it 'I see a list of students displayed alphabetically' do
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      visit '/students'

      expect(harry.name).to appear_before(longbottom.name)
      expect(harry.name).to_not appear_before(malfoy.name)

      expect(malfoy.name).to appear_before(harry.name)
      expect(malfoy.name).to appear_before(longbottom.name)

      expect(longbottom.name).to_not appear_before(harry.name)
      expect(longbottom.name).to_not appear_before(malfoy.name)
    end
  end
end
