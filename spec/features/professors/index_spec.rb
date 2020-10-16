require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/professors'," do
    it "I see a list of professors with name, age, and specialty listed" do
      professor_1 = Professor.create(
        name: "Severus Snape",
        age: 45,
        specialty: "Betrayal"
      )
      professor_2 = Professor.create(
        name: "Helena Handbasket",
        age: 50,
        specialty: "Witches Studies"
      )
      professor_3 = Professor.create(
        name: "Albus Dumbledore",
        age: 136,
        specialty: "Everything"
      )

      visit "/professors"

      expect(page).to have_content(professor_1.name)
      expect(page).to have_content(professor_1.age)
      expect(page).to have_content(professor_1.specialty)
      expect(page).to have_content(professor_2.name)
      expect(page).to have_content(professor_2.age)
      expect(page).to have_content(professor_2.specialty)
      expect(page).to have_content(professor_3.name)
      expect(page).to have_content(professor_3.age)
      expect(page).to have_content(professor_3.specialty)
    end
  end
end

describe "As a visitor" do
  it "When I visit '/professors', I see all info listed alphabetically" do
    professor_1 = Professor.create(
      name: "Severus Snape",
      age: 45,
      specialty: "Betrayal"
    )
    professor_2 = Professor.create(
      name: "Helena Handbasket",
      age: 50,
      specialty: "Witches Studies"
    )
    professor_3 = Professor.create(
      name: "Albus Dumbledore",
      age: 136,
      specialty: "Everything"
    )

    visit "/professors"

    expected = "Name: Albus Dumbledore
Age: 136
Specialty: Everything
Name: Helena Handbasket
Age: 50
Specialty: Witches Studies
Name: Severus Snape
Age: 45
Specialty: Betrayal"
    expect(page).to have_content(expected)
  end
end
