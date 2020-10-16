require 'rails_helper'

# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")

describe 'As a vistor' do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end
  describe "When I visit '/professors" do
    it 'I see a list of professors and their details' do
      visit '/professors'
      [@snape, @hagarid, @lupin].each do |professor|
        within("#professor-#{professor.id}") do
          expect(page).to have_content(professor.name)
          expect(page).to have_content(professor.age)
          expect(page).to have_content(professor.specialty)
        end
      end
    end
  end
end
