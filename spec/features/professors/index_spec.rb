require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors'" do
    it "I see a list of professors with the following information: Name, Age, Specialty. (e.g. 'Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration')" do
      snape = Professor.create(
                          name: "Severus Snape",
                          age: 45,
                          specialty: "Potions")
      hagrid = Professor.create(
                          name: "Rubeus Hagrid",
                          age: 38 ,
                          specialty: "Care of Magical Creatures")
      lupin = Professor.create(
                          name: "Remus Lupin",
                          age: 49 ,
                          specialty: "Defense Against The Dark Arts")
      visit '/professors'

      within "#professor-#{snape.id}" do
        expect(page).to have_css('.name')
        expect(page).to have_css('.age')
        expect(page).to have_css('.specialty')
      end

      within "#professor-#{hagrid.id}" do
        expect(page).to have_css('.name')
        expect(page).to have_css('.age')
        expect(page).to have_css('.specialty')
      end

      expect(page).to have_content("#{snape.name}")
      expect(page).to have_content("#{snape.age}")
      expect(page).to have_content("#{snape.specialty}")

      expect(page).to have_content("#{hagrid.name}")
      expect(page).to have_content("#{hagrid.age}")
      expect(page).to have_content("#{hagrid.specialty}")

      expect(page).to have_content("#{lupin.name}")
      expect(page).to have_content("#{lupin.age}")
      expect(page).to have_content("#{lupin.specialty}")
    end
  end
end
