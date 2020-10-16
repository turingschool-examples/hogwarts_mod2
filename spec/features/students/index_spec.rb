require 'rails_helper'

describe 'students index page' do
  it 'can visit students index page and see a list of students and how many professors each student has' do
    harry = Student.create(name: "Harry Potter",
                           age: 11,
                           house: "Gryffindor" )
    hagarid = Professor.create(name: "Rubeus Hagrid",
                               age: 38 ,
                               specialty: "Care of Magical Creatures")
    snape = Professor.create(name: "Severus Snape",
                             age: 45,
                             specialty: "Potions")
    ProfessorStudent.create(student_id: harry.id,
                            professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id,
                            professor_id: hagarid.id)
    visit '/students'
    expect(page).to have_content("Harry Potter: 2")
    end
  end
