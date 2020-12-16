require 'rails_helper'

RSpec.describe "Professors Show" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 14 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  it 'has a list of names of the students the professor has' do
    visit professor_path(@snape)

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
    expect(page).not_to have_content(@malfoy.name)
  end

  it 'shows the average age of the students for that professor' do
    visit professor_path(@snape)

    expect(page).to have_content("Average Age: 12.5")
  end
end
