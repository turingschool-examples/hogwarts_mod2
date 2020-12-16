require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit the professors index page '/professors'" do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    end

    describe 'I see a list of professors with the following information:' do
      it 'Name' do
        visit '/professors'

        within "#professor-#{@snape.id}" do
          expect(page).to have_content("Name: #{@snape.name}")
          expect(page).to have_content("Age: #{@snape.age}")
          expect(page).to have_content("Specialty: #{@snape.specialty}")
        end

        within "#professor-#{@hagarid.id}" do
          expect(page).to have_content("Name: #{@hagarid.name}")
          expect(page).to have_content("Age: #{@hagarid.age}")
          expect(page).to have_content("Specialty: #{@hagarid.specialty}")
        end

        within "#professor-#{@lupin.id}" do
          expect(page).to have_content("Name: #{@lupin.name}")
          expect(page).to have_content("Age: #{@lupin.age}")
          expect(page).to have_content("Specialty: #{@lupin.specialty}")
        end
      end
    end
  end
end
