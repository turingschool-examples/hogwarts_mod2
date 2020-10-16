require 'rails_helper'

describe "as a visitor" do
  describe "when I visit /professors" do
    before :each do
      @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    end
    it "then I see a list of professors with the following information: name, age, specialty" do

      visit("/professors")

      within("#professor-#{@snape.id}") do
        expect(page).to have_content("Name: Severus Snape")
        expect(page).to have_content("Age: 45")
        expect(page).to have_content("Specialty: Potions")
      end
      within("#professor-#{@hagarid.id}") do
        expect(page).to have_content("Name: Rubeus Hagrid")
        expect(page).to have_content("Age: 38")
        expect(page).to have_content("Specialty: Care of Magical Creatures")
      end
      within("#professor-#{@lupin.id}") do
        expect(page).to have_content("Name: Remus Lupin")
        expect(page).to have_content("Age: 49")
        expect(page).to have_content("Specialty: Defense Against The Dark Arts")
      end
    end
  end
end
