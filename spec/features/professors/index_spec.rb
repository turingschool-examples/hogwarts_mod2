require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /professors' do
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    end

    it "I see a list of professors with information" do
      visit '/professors'

      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)
      expect(page).to have_content(@lupin.name)
      expect(page).to have_content(@hagrid.age)
    end

    it "I see the list in alphabetical order" do
      visit '/professors'

      expect(page.all('li')[0]).to have_content(@lupin.name)
      expect(page.all('li')[1]).to have_content(@hagrid.name)
      expect(page.all('li')[2]).to have_content(@snape.name)
    end
  end
end
