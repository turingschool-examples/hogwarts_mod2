require "rails_helper"

describe "professors show page" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: @harry, professor: @snape)
    ProfessorStudent.create(student: @malfoy, professor: @snape)
    ProfessorStudent.create(student: @longbottom, professor: @snape)
    visit "/professors/#{@snape.id}"
  end

  it "has a list of professors with their name, age, and specialty" do
    expect(page).to have_content(@snape.name+"'s Students")
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@longbottom.name)
  end
end
