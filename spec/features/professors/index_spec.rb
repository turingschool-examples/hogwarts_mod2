require "rails_helper"

RSpec.describe "As a visitor" do
  describe "When I visit '/professors'," do
    it "I see a list of professors with the following information: Name, Age, Specialty" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      visit "/professors"

      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
  end
end