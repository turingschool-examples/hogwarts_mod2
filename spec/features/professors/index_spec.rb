# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the '/professors' path" do
    it "can see a list of professors including all attributes" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit '/professors'

      expect(page).to have_content("#{snape.name}")
      expect(page).to have_content("#{snape.age}")
      expect(page).to have_content("#{snape.specialty}")
      expect(page).to have_content("#{hagarid.name}")
      expect(page).to have_content("#{hagarid.age}")
      expect(page).to have_content("#{hagarid.specialty}")
      expect(page).to have_content("#{lupin.name}")
      expect(page).to have_content("#{lupin.age}")
      expect(page).to have_content("#{lupin.specialty}")
    end
  end
end
