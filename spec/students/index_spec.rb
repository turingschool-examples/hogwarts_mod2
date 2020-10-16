# User Story 3 of 4
require 'rails_helper'
describe "As a visitor," do
  describe "When I visit '/students'" do
    it "I see a list of students and the number of professors each student has" do
      @student = Student.create!(
                                      name: 'Neville Longbottom',
                                      age: 14,
                                      house: "Grifyndor"
                                    )
      @professor_1 = Professor.create!(name: 'Severus Snape',
                                      age: 202,
                                      specialty: "Potions")
      @professor_2 = Professor.create!(name: 'Minerva McGonagall',
                                      age: 205,
                                      specialty: "Transfiguration")
      @professor_3 = Professor.create!(name: 'Joe Bob',
                                      age: 100,
                                      specialty: "Math")
      ProfessorStudent.create!(professor: @professor_1, student: @student)
      ProfessorStudent.create!(professor: @professor_2, student: @student)
      ProfessorStudent.create!(professor: @professor_3, student: @student)
      visit '/students'
      expect(page).to have_content(student_1.name)
      expect(page).to have_content(3)
    end
  end
end
