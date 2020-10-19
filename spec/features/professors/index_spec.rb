require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit /professors' do
    it 'should see a list of professors with their information.' do
      snape = Professor.create(name: 'Severus Snape', age: 45, specialty: 'Potions')
      hagarid = Professor.create(name: 'Rubeus Hagrid', age: 38, specialty: 'Care of Magical Creatures')
      lupin = Professor.create(name: 'Remus Lupin', age: 49, specialty: 'Defense Against The Dark Arts')

      visit '/professors'

      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
      expect(page).to have_content(hagarid.name)
      expect(page).to have_content(hagarid.age)
      expect(page).to have_content(hagarid.specialty)
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
    end

    it 'list names alphabetically' do
      snape = Professor.create(name: 'Severus Snape', age: 45, specialty: 'Potions')
      hagarid = Professor.create(name: 'Rubeus Hagrid', age: 38, specialty: 'Care of Magical Creatures')
      lupin = Professor.create(name: 'Remus Lupin', age: 49, specialty: 'Defense Against The Dark Arts')

      visit '/professors'

      within all('.professor')[0] do
        expect(page).to have_content(lupin.name)
      end

      within all('.professor')[1] do
        expect(page).to have_content(hagarid.name)
      end

      within all('.professor')[2] do
        expect(page).to have_content(snape.name)
      end
    end
  end
end
