require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors'"  do
    it "I see a list of professors with the following information:" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit "/professors"
      expect(page).to have_content("Name: Severus Snape")
      expect(page).to have_content("Name: Rubeus Hagrid")
      expect(page).to have_content("Name: Remus Lupin")
      expect(page).to have_content("Age: 45")
      expect(page).to have_content("Age: 38")
      expect(page).to have_content("Age: 49")
      expect(page).to have_content("Specialty: Potions")
      expect(page).to have_content("Specialty: Care of Magical Creatures")
      expect(page).to have_content("Specialty: Defense Against The Dark Arts")
    end
  end
end
