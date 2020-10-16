require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit /professors/:id' do
    it 'I see a list of students a professor has' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = snape.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      visit "/professors/#{snape.id}"

      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.age)
    end
  end
end
