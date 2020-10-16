# User Story 1 of 4
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")

require 'rails_helper'
describe "As a visitor," do
  describe "When I visit '/professors'" do
    it "I see a list of professors with their name, age, and specialty" do
      professor_1 = Professor.create(
                                      name: 'Severus Snape',
                                      age: 202,
                                      specialty: "Potions"
                                    )

      professor_2 = Professor.create(
                                      name: 'Minerva McGonagall',
                                      age: 204,
                                      specialty: "Transfiguration"
                                    )
      visit '/professors'

      expect(page).to have_content(professor_1.name)
      expect(page).to have_content(professor_1.age)
      expect(page).to have_content(professor_1.specialty)

      expect(page).to have_content(professor_2.name)
      expect(page).to have_content(professor_2.age)
      expect(page).to have_content(professor_2.specialty)
    end
  end
end
