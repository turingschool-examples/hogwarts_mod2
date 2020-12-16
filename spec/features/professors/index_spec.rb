require 'rails_helper'

describe 'Professor Index Page' do
  describe 'as a visitor' do
    it 'lists professors and their information' do
      visit "/professors"

      expect(page).to have_content("Accio Professors")
      expect(page).to have_content("Age:")
      expect(page).to have_content("Specialty:")

      expect(page).to have_content("Severus Snape")
      expect(page).to have_content("45")
      expect(page).to have_content("Potions")
      expect(page).to have_content("Rubeus Hagrid")
      expect(page).to have_content("38")
      expect(page).to have_content("Care of Magical Creatures")
      expect(page).to have_content("Remus Lupin")
      expect(page).to have_content("49")
      expect(page).to have_content("Defense Against The Dark Arts")
    end
  end
end