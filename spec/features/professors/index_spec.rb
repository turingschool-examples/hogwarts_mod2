require 'rails_helper'

describe "As A Visitor" do
  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall",
                                   age: 204,
                                   specialty: "Transfiguration")

    @professor2 = Professor.create(name: "Severus Snape",
                                   age: 50,
                                   specialty: "Potions")
  end

  describe "when I visit /professors" do
    it "shows a list of professors and their details" do
      visit '/professors'

      expect(page).to have_content(@professor1.name)
      expect(page).to have_content(@professor1.age)
      expect(page).to have_content(@professor1.specialty)

      expect(page).to have_content(@professor2.name)
      expect(page).to have_content(@professor2.age)
      expect(page).to have_content(@professor2.specialty)
    end
  end
end
