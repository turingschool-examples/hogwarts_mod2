require 'rails_helper'

RSpec.describe 'As A Visitor' do
  before :each do
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    
    @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create!(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create!(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    
    ProfessorStudent.create!(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create!(student_id: @malfoy.id, professor_id: @snape.id)
    ProfessorStudent.create!(student_id: @longbottom.id, professor_id: @snape.id)
  end

  describe 'When I Visit A Singular Professors Show Page' do
    it 'shows the names of all students that professor has' do
      visit "/professors/#{@snape.id}"

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@malfoy.name)
      expect(page).to have_content(@longbottom.name)
    end
  end
end