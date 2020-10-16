require 'rails_helper'

describe "As a visitor" do
  before :each do
    @hagrid = Professor.create!(
                  name: "Rubeus Hagrid",
                  age: 46,
                  specialty: "Care of Magical Creatures")
    @mcgonagall = Professor.create!(
                  name: "Minerva McGonagall",
                  age: 204,
                  specialty: "Transfiguration")
    @snape = Professor.create!(
                  name: "Severus Snape",
                  age: 40,
                  specialty: "Potions")
  end

  describe "When I visit the professor index page" do
    it "Shows a list of professors and their details" do
      visit '/professors'

      expect(page).to have_content("#{@mcgonagall.name}")
      expect(page).to have_content("#{@mcgonagall.age}")
      expect(page).to have_content("#{@mcgonagall.specialty}")

      expect(page).to have_content("#{@snape.name}")
      expect(page).to have_content("#{@snape.age}")
      expect(page).to have_content("#{@snape.specialty}")
    end

    it "Shows a list of profs in alphabetical order" do
      visit "/professors/"

      expect(page.all('li')[0]).to have_content("#{@mcgonagall.name}")
      expect(page.all('li')[1]).to have_content("#{@hagrid.name}")
      expect(page.all('li')[2]).to have_content("#{@snape.name}")
    end
  end

end
