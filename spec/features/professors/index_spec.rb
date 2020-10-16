require 'rails_helper'

describe 'Professor index page' do
  prof_1 = Professor.create(name: 'Billy Bob',
                            age: 953,
                            specialty: 'Beer drinkin')
  prof_2 = Professor.create(name: 'Nicky',
                            age: 5,
                            specialty: 'Vodoo')

  before do
    visit '/professors'
  end

  it 'lists info for all professors' do
    expect(page).to have_content('Professors:')
    expect(page).to have_content(prof_1.name)
    expect(page).to have_content("Age: #{prof_1.age}")
    expect(page).to have_content("Specialty: #{prof_1.specialty}")
    expect(page).to have_content(prof_2.name)
    expect(page).to have_content("Age: #{prof_2.age}")
    expect(page).to have_content("Specialty: #{prof_2.specialty}")
  end
end
