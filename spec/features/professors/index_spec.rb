require 'rails_helper'

RSpec.describe 'As A Visitor' do
  before :each do
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end

  describe 'When I Visit Professors Index Page' do
    it 'shows all professors name, age and course(specialty)' do
      visit '/professors'

      expect(page).to have_content(@snape.name)
      expect(page).to have_content(@snape.age)
      expect(page).to have_content(@snape.specialty)

      expect(page).to have_content(@hagrid.name)
      expect(page).to have_content(@hagrid.age)
      expect(page).to have_content(@hagrid.specialty)

      expect(page).to have_content(@lupin.name)
      expect(page).to have_content(@lupin.age)
      expect(page).to have_content(@lupin.specialty)
    end

    it 'shows all names in alphabetical order' do
      visit '/professors'

      expect("#{@lupin.name}").to appear_before("#{@hagrid.name}")
      expect("#{@hagrid.name}").to appear_before("#{@snape.name}")
    end
  end
end