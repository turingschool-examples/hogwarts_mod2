require 'rails_helper'

describe 'Professors Show Page' do
  describe 'as a visitor' do
    it 'lists the students the professor has' do
      snape =  Professor.find_by_name("Severus Snape")

      visit "/professors/#{snape.id}"

      expect(page).to have_content("Harry Potter")
      expect(page).to have_content("Neville Longbottom")
    end
  end
end