require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @snape.id)
  end

  it 'Displays all students of the prof' do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content("#{@harry.name}") && have_content("#{@malfoy.name}") && not_have_content("#{@longbottom.name}")
  end
end