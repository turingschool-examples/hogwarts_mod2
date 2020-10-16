#User Story 1 of 4
require 'rails_helper'

describe "As a visitor," do
  before(:each) do
    @professor = Professor.create!({name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"
                                    })
  end
  describe "When I visit '/professors'," do
    it "I see a list of professors with the following information:" do
      visit '/professors'
      expect(page).to have_content(@professor.name)
      expect(page).to have_content(@professor.age)
      expect(page).to have_content(@professor.specialty)
    end
  end
end
