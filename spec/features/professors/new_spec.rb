require "rails_helper"

describe 'As a visitor' do
  describe 'When i visit /professors' do
    it 'I see a list of professors with name, age, and specialty' do
      professor = Professor.create(name: 'Severus Snape', age: '45', specialty: 'Potions')

      visit '/professors'
      
      expect(page).to have_content("Name: #{professor.name}")
      expect(page).to have_content("Age: #{professor.age}")
      expect(page).to have_content("Specialty: #{professor.specialty}")
    end
  end
end
