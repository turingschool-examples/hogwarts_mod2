require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a professor show page' do
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
      it 'I see a list of the names of the students the professors have.' do
      visit "/professors/#{@snape.id}"

       expect(page).to have_content("#{@harry.name}")
       expect(page).to have_content("#{@longbottom.name}")
       expect(page).to_not have_content("#{@malfoy.name}")
    end
  end
end
