require'rails_helper'

RSpec.describe 'professors show page', type: :feature do
  it "can see all professors students" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    snape.students << harry
    snape.students << malfoy

    visit "/professors/#{snape.id}"
    expect(page).to have_content(harry.name)
    expect(page).to have_content(malfoy.name)
  end

  it "can see all professors students age" do

    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    snape.students << harry
    snape.students << longbottom

    visit "/professors/#{snape.id}"
    expect(page).to have_content("Average Student Age: 11")
  end
end
