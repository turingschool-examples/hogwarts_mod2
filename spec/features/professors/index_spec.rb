require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/professors'" do
    it "I see a list of professors with the following information:
        -Name
        -Age
        -Specialty" do

        snape = Professor.create!(
          name: "Severus Snape",
          age: 44,
          specialty: "Potions"
        )

        lupin = Professor.create!(
          name: "Remus Lupin",
          age: 38,
          specialty: "Defense Against the Dark Arts"
        )

        visit '/professors'

        expect(page).to have_content("Severus Snape")  
        expect(page).to have_content("44")  
        expect(page).to have_content("Potions")  
        expect(page).to have_content("Remus Lupin")  
        expect(page).to have_content("38")  
        expect(page).to have_content("Defense Against the Dark Arts")  
    end 
  end 
end 

  