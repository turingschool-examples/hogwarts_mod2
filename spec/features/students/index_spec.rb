require 'rails_helper'

describe 'Student Index Page' do
  describe 'as a visitor' do
    it 'lists the students and the number of professors' do
      visit "/students"

      expect(page).to have_content("Harry Potter: 2")
    end
  end
end