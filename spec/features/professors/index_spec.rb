require 'rails_helper'

describe "As a visitor" do
  before :each do
    @mcgonagall = Professor.create!(
                  name: "Minerva McGonagall",
                  age: 204,
                  specialty: "Transfiguration")
    @snape = Professor.create!(
                  name: "Severus Snape",
                  age: 40,
                  specialty: "Potions")
  end

  describe "When I visit the professor show page" do
    it "Shows a list of professors and their details" do
      visit '/professors'

      expect(page).to have_content("#{@mcgonagall.name}")
      expect(page).to have_content("#{@mcgonagall.age}")
      expect(page).to have_content("#{@mcgonagall.specialty}")

      expect(page).to have_content("#{@snape.name}")
      expect(page).to have_content("#{@snape.age}")
      expect(page).to have_content("#{@snape.specialty}")
    end
  end

end
