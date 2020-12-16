require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the students index page' do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create!(
          professor_id: @snape.id,
          student_id: @harry.id
        )

        ProfessorStudent.create!(
          professor_id: @snape.id,
          student_id: @longbottom.id
        )
      end
      it 'Shows a list of students and number of professors for each student' do
        visit '/students'

        expect(page).to have_content("#{@harry.name}: 1")
        expect(page).to have_content("#{@longbottom.name}: 1")
      end
      it 'Lists information alphabetically' do
        visit '/students'

        expect("#{@malfoy.name}").to appear_before("#{@harry.name}")
        expect("#{@harry.name}").to appear_before("#{@longbottom.name}")
      end
  end
end
