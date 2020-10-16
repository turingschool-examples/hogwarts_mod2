require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have.
    (e.g. 'Neville Longbottom'
          'Hermione Granger'
          'Luna Lovegood')" do
      snape = Professor.create(
                          name: "Severus Snape",
                          age: 45,
                          specialty: "Potions")
      hagrid = Professor.create(
                          name: "Rubeus Hagrid",
                          age: 38 ,
                          specialty: "Care of Magical Creatures")
      lupin = Professor.create(
                          name: "Remus Lupin",
                          age: 49 ,
                          specialty: "Defense Against The Dark Arts")
      visit '/professors'

    end
  end
end
