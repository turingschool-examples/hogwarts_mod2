require "rails_helper"

describe 'professors index page' do
  it 'can visit /professors and see a list of professors with their information' do
    snape = Professor.create(name: "Severus Snape",
                             age: 45,
                             specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid",
                               age: 38 ,
                               specialty: "Care of Magical Creatures")
    visit '/professors'

    expect(page).to have_content("Name: Severus Snape")
    expect(page).to have_content("Age: 45")
    expect(page).to have_content("Specialty: Potions")
  end
end
