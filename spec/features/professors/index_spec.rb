require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the professors index page' do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    end
    it 'Shows a list of professors and its attributes' do
      visit '/professors'
      expect(page).to have_content("#{@snape.name}")
      expect(page).to have_content("#{@snape.age}")
      expect(page).to have_content("#{@snape.specialty}")
      expect(page).to have_content("#{@hagarid.name}")
      expect(page).to have_content("#{@hagarid.age}")
      expect(page).to have_content("#{@hagarid.specialty}")
      expect(page).to have_content("#{@lupin.name}")
      expect(page).to have_content("#{@lupin.age}")
      expect(page).to have_content("#{@lupin.specialty}")
    end
    it 'Lists information alphabetically' do
      visit '/professors'

      expect("#{@lupin}").to appear_before("#{@hagarid}")
      expect("#{@hagarid}").to appear_before("#{@snape}")
    end
  end
end
