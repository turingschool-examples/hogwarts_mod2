require 'rails_helper'

RSpec.describe 'Professors index page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

  end

  it "displays each professor in the system with attributes" do
    visit '/professors'

    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@snape.age)
    expect(page).to have_content(@snape.specialty)
    expect(page).to have_content(@hagrid.name)
    expect(page).to have_content(@hagrid.age)
    expect(page).to have_content(@hagrid.specialty)
    expect(page).to have_content(@lupin.name)
    expect(page).to have_content(@lupin.age)
    expect(page).to have_content(@lupin.specialty)

  end

  xit "displays professors alphabetically" do
    visit '/professors'

    within '#name' do
      expect(page.all('.name')[0]).to have_content("Remus Lupin")
      expect(page.all('.name')[1]).to have_content("Rubeus Hagrid")
      expect(page.all('.name')[2]).to have_content("Severus Snape")
    end
  end
end
