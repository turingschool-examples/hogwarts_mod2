require "rails_helper"

describe 'professor show page' do
  it 'can see a list of the names of the students the professors have' do
    snape = Professor.create(name: "Severus Snape",
                             age: 45,
                             specialty: "Potions")
    harry = Student.create(name: "Harry Potter",
                           age: 11,
                           house: "Gryffindor" )
    ProfessorStudent.create(student_id: harry.id,
                            professor_id: snape.id)
    visit "/professors/#{snape.id}"

    expect(page).to have_content("Harry Potter")
  end

  it 'can see average age of all students for that professor' do
  snape = Professor.create(name: "Severus Snape",
                           age: 45,
                           specialty: "Potions")
  harry = Student.create(name: "Harry Potter",
                         age: 11,
                         house: "Gryffindor" )
  malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
  ProfessorStudent.create(student_id: harry.id,
                          professor_id: snape.id)
  ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
  visit "/professors/#{snape.id}"

  expect(page).to have_content("Average Age: 11.5")
  end
end
