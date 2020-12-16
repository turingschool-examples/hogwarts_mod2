require 'rails_helper'

RSpec.describe "Show" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = @snape.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
  end
  it 'show all students a professor has' do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@longbottom.name)
  end
end