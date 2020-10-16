require'rails_helper'

RSpec.describe 'students index page', type: :feature do
  it "can see all students and the count of professors" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    harry.professors << snape
    harry.professors << lupin
    harry.professors << hagarid
    malfoy.professors << lupin

    visit "/students"

    within("#student-#{harry.id}") do
      expect(page).to have_content(harry.name)
      expect(page).to have_content("3")
    end
    within("#student-#{malfoy.id}") do
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content("1")
    end
  end
end
