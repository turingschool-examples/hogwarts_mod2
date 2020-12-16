require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/students'" do
    before :each do
      @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create!(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create!(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @lupin.id)

      visit '/students'
    end

    it 'I see a list of students with their professor count next to their name' do
      within '#student-list' do
        expect(page).to have_content("#{@harry.name}: 1")
        expect(page).to have_content("#{@malfoy.name}: 1")
        expect(page).to have_content("#{@longbottom.name}: 2")
      end
    end
  end
end
