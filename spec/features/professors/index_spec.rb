require "rails_helper"

describe "As a visitor" do
  describe "when I visit '/professors'" do
    it "I see a list of professors with some info" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit("/professors")

      expect(page).to have_content("Professors Index")
      expect(page).to have_link("#{snape.name}'s Students")
      expect(page).to have_content("Name: #{snape.name}")
      expect(page).to have_content("Age: #{hagarid.age}")
      expect(page).to have_content("Specialty: #{lupin.specialty}")
    end
  end
end
