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
end


# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")