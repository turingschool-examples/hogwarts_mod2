require 'rails_helper'

RSpec.describe 'Professors index page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end

  it 'Displays correct information' do
    visit "/professors"

    expect(page).to have_content("#{@snape.name}") && have_content("#{@snape.age}") && have_content("#{@snape.specialty}")
    expect(page).to have_content("#{@hagrid.name}") && have_content("#{@hagrid.age}") && have_content("#{@hagrid.specialty}")
    expect(page).to have_content("#{@lupin.name}") && have_content("#{@lupin.age}") && have_content("#{@lupin.specialty}")
  end
end