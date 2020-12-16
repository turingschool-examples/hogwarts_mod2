require "rails_helper"

describe "students index page" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: @harry, professor: @snape)
    ProfessorStudent.create(student: @harry, professor: @hagarid)
    ProfessorStudent.create(student: @harry, professor: @lupin)
    ProfessorStudent.create(student: @malfoy, professor: @snape)
    ProfessorStudent.create(student: @longbottom, professor: @snape)

    visit "/students"
  end

  it "has a list of students with their name and number of professors" do
    expect(page).to have_content(@harry.name + ": 3")
    expect(page).to have_content(@malfoy.name + ": 1")
    expect(page).to have_content(@longbottom.name + ": 1")
  end

  it "lists records in alphabetical order" do
    pb = page.body
    expect(pb.index(@malfoy.name)).to be < (pb.index(@harry.name))
    expect(pb.index(@harry.name)).to be < (pb.index(@longbottom.name))
  end
end
