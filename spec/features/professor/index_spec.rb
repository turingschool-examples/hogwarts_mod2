require 'rails_helper'

RSpec.describe "As a visitor when I visit '/professors'", type: :feature do 
  it "can see a list of professors with their attributes" do 
    snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

    visit '/professors'

    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)

    expect(page).to have_content(hagrid.name)
    expect(page).to have_content(hagrid.age)
    expect(page).to have_content(hagrid.specialty)
  end
  it "can see list of professors alphabetically" do 
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit "/professors"

    expect("#{lupin.name}").to appear_before("#{hagrid.name}")
    expect("#{hagrid.name}").to appear_before("#{snape.name}")
  end
end

