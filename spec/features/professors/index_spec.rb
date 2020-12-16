require 'rails_helper'

RSpec.describe 'Professors index page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end

  it "displays names of all professors" do
    visit '/professors'
    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@hagarid.name)
  end
end
