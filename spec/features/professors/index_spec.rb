require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the professors index' do
    it 'I can see a list of professors with their name, age, and specialty' do
      @mcgonagall = Professor.create!(
        name: 'Minerva McGonagall',
        age: 204,
        specialty: 'transfiguration'
      )
      @snape = Professor.create!(
        name: 'Severus Snape',
        age: 38,
        specialty: 'potions'
      )
      @flitwick = Professor.create!(
        name: 'Filius Flitwick',
        age: 85,
        specialty: 'spells and charms'
      )
      @sprout = Professor.create!(
        name: 'Pomona Sprout',
        age: 87,
        specialty: 'herbology'
      )

      visit '/professors'
      expect(page).to have_content(@mcgonagall.name)
      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@flitwick.name)
      expect(page).to have_content(@sprout.name)
      expect(page).to have_content(@mcgonagall.age)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@flitwick.age)
      expect(page).to have_content(@sprout.age)
      expect(page).to have_content(@mcgonagall.specialty)
      expect(page).to have_content(@snape.specialty)
      expect(page).to have_content(@flitwick.specialty)
      expect(page).to have_content(@sprout.specialty)
      save_and_open_page
    end
  end
end
