require 'rails_helper'

describe 'professors index page' do
  let!(:professor1) { create(:professor) }
  let!(:professor2) { create(:professor, name: 'Taylor', age: 124, specialty: 'Flying') }

  before do
    visit '/professors'
  end

  it 'can see title' do
    expect(page).to have_content('Hogwarts Professors') 
  end

  it 'can see all professors information' do
    expect(page).to have_content(professor1.name)
    expect(page).to have_content(professor1.age)
    expect(page).to have_content(professor1.specialty)

    expect(page).to have_content(professor2.name)
    expect(page).to have_content(professor2.age)
    expect(page).to have_content(professor2.specialty)
  end
end
