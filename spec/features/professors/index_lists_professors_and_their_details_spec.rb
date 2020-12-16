require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end
  describe 'when I visit the professors index page' do
    
    it 'lists all professors and their information' do
      visit '/professors'
      
      within("#prof-section-#{@snape.id}") do
        expect(page).to have_content("Name: #{@snape.name}")
        expect(page).to have_content("Age: #{@snape.age}")
        expect(page).to have_content("Specialty: #{@snape.specialty}")
      end

      within("#prof-section-#{@hagarid.id}") do
        expect(page).to have_content("Name: #{@hagarid.name}")
        expect(page).to have_content("Age: #{@hagarid.age}")
        expect(page).to have_content("Specialty: #{@hagarid.specialty}")
      end

      within("#prof-section-#{@lupin.id}") do
        expect(page).to have_content("Name: #{@lupin.name}")
        expect(page).to have_content("Age: #{@lupin.age}")
        expect(page).to have_content("Specialty: #{@lupin.specialty}")
      end
    end
  end
end