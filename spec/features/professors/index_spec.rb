require 'rails_helper'

RSpec.describe 'Professors Index Page' do
  describe 'As a visitor' do
    before :each do
      @professor_1 = Professor.create!(
        name: 'Minerva McGonagall',
        age: 204,
        specialty: 'Transfiguration'
      )
      @professor_2 = Professor.create!(
        name: 'Cuthbert Binns',
        age: 124,
        specialty: 'History of Magic'
      )
      @professor_3 = Professor.create!(
        name: 'Firenze',
        age: 285,
        specialty: 'Divination'
      )
    end

    it 'can see display of each professors information (name, age, speciality)' do
      visit '/professors'

      expect(page).to have_content('List of all our Professors')

      expect(page).to have_content('Minerva McGonagall')
      expect(page).to have_content('204')
      expect(page).to have_content('Transfiguration')

      expect(page).to have_content('Cuthbert Binns')
      expect(page).to have_content('124')
      expect(page).to have_content('History of Magic')

      expect(page).to have_content('Firenze')
      expect(page).to have_content('285')
      expect(page).to have_content('Divination')
    end
  end
end
