require 'rails_helper'

RSpec.describe "Professors Features:" do
  describe "As a visitor" do
    describe "When I visit '/professors'" do
      it "I see a list of professors with their name, age, and specialty" do
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        professors = [snape, hagrid, lupin]

        visit '/professors'

        professors.each do |professor|
          within("professor-#{professor.id}") do
            expect(page).to have_content("Name: #{professor.name}")
            expect(page).to have_content("Age: #{professor.age}")
            expect(page).to have_content("Specialty: #{professor.specialty}")
          end
        end
      end
    end
  end
end
