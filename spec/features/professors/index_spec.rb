require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit /professors' do
    it 'I see a list of professors and their info' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

      visit '/professors'

      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(hagarid.specialty)
    end

    it 'I see a list of professors displayed alphabetically' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit '/professors'

      expect(hagarid.name).to appear_before(snape.name)
      expect(hagarid.name).to_not appear_before(lupin.name)

      expect(lupin.name).to appear_before(hagarid.name)
      expect(lupin.name).to appear_before(snape.name)

      expect(snape.name).to_not appear_before(hagarid.name)
      expect(snape.name).to_not appear_before(lupin.name)
    end
  end
end
