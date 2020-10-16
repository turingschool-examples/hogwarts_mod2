require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/professors'," do
    it "I see a list of professors with name, age and specialty" do
      professor_1 = Professor.create(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
      )
      professor_2 = Professor.create(
        name: "Severus Snape",
        age: 42,
        specialty: "Potions"
      )
      professor_3 = Professor.create(
        name: "Rubeus Hagrid",
        age: 51,
        specialty: "Care of Magical Creatures"
      )

      visit '/professors'

      expect(page).to have_content("Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
      expect(page).to have_content("Name: Severus Snape, Age: 42, Specialty: Potions")
      expect(page).to have_content("Name: Rubeus Hagrid, Age: 51, Specialty: Care of Magical Creatures")
    end
  end
end
