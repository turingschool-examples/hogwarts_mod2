require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create!(professor_id: @snape.id, student_id: @harry.id)
    ProfessorStudent.create!(professor_id: @snape.id, student_id: @malfoy.id)
    ProfessorStudent.create!(professor_id: @hagarid.id, student_id: @harry.id)
    ProfessorStudent.create!(professor_id: @hagarid.id, student_id: @longbottom.id)
    ProfessorStudent.create!(professor_id: @lupin.id, student_id: @harry.id)
    ProfessorStudent.create!(professor_id: @lupin.id, student_id: @longbottom.id)

  end
  describe "when I visit the student index page" do
    
    it 'lists all students and their professor count' do
      visit "/students"
     
     expect(page).to have_content("Harry Potter: 3")
     expect(page).to have_content("Draco Malfoy: 1")
     expect(page).to have_content("Neville Longbottom: 2")
    end
  end
end