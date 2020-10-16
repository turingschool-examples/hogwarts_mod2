require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit the professors index page' do
    it 'has a list of professors with their information' do
      minerva = Professor.create!({ name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"})
      lupin   = Professor.create!({ name: "Remus Lupin",
                                    age: 38,
                                    specialty: "Lycanthropy"})
      snape   = Professor.create!({ name: "Severus Snape",
                                    age: 38,
                                    specialty: "Potions"})

      visit '/professors'

      expect(page).to have_content(minerva.name)
      expect(page).to have_content(minerva.age)
      expect(page).to have_content(minerva.specialty)
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
      expect(page).to have_content(snape.name)
      expect(page).to have_content(snape.age)
      expect(page).to have_content(snape.specialty)
    end
  end
end
