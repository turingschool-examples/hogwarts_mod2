require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit '/professors'" do
    it "I see a list of professors with their name, age, and specialty" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      visit '/professors'

      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
  end
end
