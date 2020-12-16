require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create!(professor_id: @snape.id, student_id: @harry.id)
    ProfessorStudent.create!(professor_id: @snape.id, student_id: @malfoy.id)
  end
  describe "when I visit a professor's show page" do
    
    it 'lists all professors and their information' do
      visit "/professors/#{@snape.id}"

     expect(page).to have_content("Harry Potter")
     expect(page).to have_content("Draco Malfoy")
     expect(page).not_to have_content("Neville Longbottom")
    end
  end
end