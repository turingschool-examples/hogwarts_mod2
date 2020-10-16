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
      @professor_1 = Professor.create!(name: 'Severus Snape',
                                      age: 202,
                                      specialty: "Potions")

      @student_1 = Student.create!(name: 'Neville Longbottom',
                                  age: 14,
                                  house: "Hufflepuff")
      @student_2 = Student.create!(name: 'Luna Lovegood',
                                  age: 14,
                                  house: "Hufflepuff")

      ProfessorStudent.create!(professor: @professor_1, student: @student_1)
      ProfessorStudent.create!(professor: @professor_1, student: @student_2)

      visit "/professors/#{@professor_1.id}"

      expect(page).to have_content(@professor_1.name)
      expect(page).to have_content(@student_1.name)
    end
  end
end
