require 'rails_helper'

RSpec.describe "Index" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
  end
  it 'can show a list of professors along with their name, age, and specialty' do
    visit '/professors'

    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@snape.age)
    expect(page).to have_content(@snape.specialty)
    expect(page).to have_content(@hagarid.name)
    expect(page).to have_content(@hagarid.age)
    expect(page).to have_content(@hagarid.specialty)
  end
end