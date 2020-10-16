require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/professors'," do
    it "I see a list of professors in alphabetical order with name, age and specialty" do
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

      expect(page.all('p')[0]).to have_content("Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
      expect(page.all('p')[1]).to have_content("Name: Rubeus Hagrid, Age: 51, Specialty: Care of Magical Creatures")
      expect(page.all('p')[2]).to have_content("Name: Severus Snape, Age: 42, Specialty: Potions")
    end
  end
end
