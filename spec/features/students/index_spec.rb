require 'rails_helper'

RSpec.describe 'As A Visitor' do
  before :each do
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create!(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    
    ProfessorStudent.create!(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create!(student_id: @malfoy.id, professor_id: @snape.id)
    ProfessorStudent.create!(student_id: @malfoy.id, professor_id: @lupin.id)
  end

  describe 'When I Visit The Students Index' do
    it 'lists all students with their count of professors' do
      visit '/students'

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@harry.professors.count)

      expect(page).to have_content(@malfoy.name)
      expect(page).to have_content(@malfoy.professors.count)
    end
  end
end