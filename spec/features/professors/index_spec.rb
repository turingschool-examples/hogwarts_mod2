require 'rails_helper'

describe "As A Visitor" do
  before :each do
    @professor1 = Professor.create(name: "Severus Snape",
                                   age: 50,
                                   specialty: "Potions")

    @professor2 = Professor.create(name: "Minerva McGonagall",
                                   age: 204,
                                   specialty: "Transfiguration")
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

    it "shows professors alphabetically by name" do
      visit '/professors'
      
      within '.professor-index' do
        expect(page.all('p')[0]).to have_content(@professor2.name)
        expect(page.all('p')[1]).to have_content(@professor1.name)
      end
    end
  end
end
