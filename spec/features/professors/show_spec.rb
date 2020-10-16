# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#      "Hermione Granger"
#      "Luna Lovegood")
require 'rails_helper'
describe "As a visitor," do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have" do
      professor_1 = Professor.create(
                                      name: 'Severus Snape',
                                      age: 202,
                                      specialty: "Potions"
                                    )

      student_1 = Student.create(
                                      name: 'Neville Longbottom',
                                      age: 14,
                                      house: "Grifyndor"
                                    )
      student_2 = Student.create(
                                      name: 'Lune Lovegood',
                                      age: 14,
                                      specialty: "Hufflepuff"
                                    )
      visit '/professors//id'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_2.name)
    end
  end
end
