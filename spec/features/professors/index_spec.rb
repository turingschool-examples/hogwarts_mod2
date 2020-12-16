require 'rails_helper'

describe "when I visit '/professors'" do
  it "can see a list of professors with name, age, speciality" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

    visit '/professors'

    expect(page).to have_content(snape.name)
    expect(page).to have_content(snape.age)
    expect(page).to have_content(snape.specialty)
    expect(page).to have_content(hagarid.name)
    expect(page).to have_content(hagarid.age)
    expect(page).to have_content(hagarid.specialty)
  end
end
