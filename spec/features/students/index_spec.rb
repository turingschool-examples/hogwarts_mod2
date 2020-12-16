require 'rails_helper'

RSpec.describe "Index" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @dumbdoor = Professor.create(name: "Dumble Door", age: 2 , specialty: "Unknown")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @dumbdoor.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @snape.id)
  end
  it 'can show a list of student names and how many professors each student has' do
    visit '/students'

    harry_content = "Harry Potter: 3"
    malfoy_content = "Draco Malfoy: 5"
    expect(page).to have_content(harry_content)
    expect(page).to have_content(malfoy_content)
  end
end