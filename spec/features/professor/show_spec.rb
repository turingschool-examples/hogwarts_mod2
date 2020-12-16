require 'rails_helper'

RSpec.describe "As a visitor when I visit '/professors/:id'", type: :feature do 
  it "can see the names of students the professor has" do 
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/professors/#{snape.id}"

    expect(page).to have_content("#{harry.name}")
    expect(page).to have_content("#{longbottom.name}")
  end
  it "can see average age of all students for that professor" do 
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagrid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

    visit "/professors/#{snape.id}"

    expect(page).to have_content("Average Student Age: 11.0")

    visit "/professors/#{hagrid.id}"

    expect(page).to have_content("Average Student Age: 11.5")

    visit "/professors/#{lupin.id}"

    expect(page).to have_content("Average Student Age: 11.5")
  end
end

