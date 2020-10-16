require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit '/professors'" do
    it "I see a list of professors in (alphabetical order) with their name, age, and specialty" do

      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit '/professors'

      # within ".professors" do
      #   expect(page.all('.professor')[0]).to have_content(lupin.name)
      #   expect(page.all('.professor')[1]).to have_content(hagrid.name)
      #   expect(page.all('.professor')[2]).to have_content(snape.name)
      # end

      within "#professor-#{snape.id}" do
        expect(page).to have_content(snape.name)
        expect(page).to have_content(snape.age)
        expect(page).to have_content(snape.specialty)
      end

      within "#professor-#{hagrid.id}" do
        expect(page).to have_content(hagrid.name)
        expect(page).to have_content(hagrid.age)
        expect(page).to have_content(hagrid.specialty)
      end

      within "#professor-#{lupin.id}" do
        expect(page).to have_content(lupin.name)
        expect(page).to have_content(lupin.age)
        expect(page).to have_content(lupin.specialty)
      end


    end
  end

end
