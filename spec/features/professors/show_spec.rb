require 'rails_helper'

RSpec.describe "As a visitor I visit professors show page" do
  before :each do
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create!(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create!(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create!(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create!(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create!(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create!(student_id: @malfoy.id, professor_id: @hagarid.id)
    ProfessorStudent.create!(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create!(student_id: @longbottom.id, professor_id: @snape.id)
  end
  it "displays a list of the names of students the professors have" do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
  end

  it "I see the avg age of all students for that professor" do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content("Average Age of Students: 11.3")
  end
end
