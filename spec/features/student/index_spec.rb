require 'rails_helper'

RSpec.describe "As a visitor when I visit '/students'" do 
  it "can see list of students and number of professor per student" do 

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

    visit "/students"

    expect(page).to have_content("#{harry.name}: 3")
    expect(page).to have_content("#{malfoy.name}: 2")
    expect(page).to have_content("#{longbottom.name}: 1")
  end
    it "can see list of students alphabetically" do 
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      visit "/students"

      expect("#{malfoy.name}").to appear_before("#{harry.name}")
      expect("#{harry.name}").to appear_before("#{longbottom.name}")
  end
end
