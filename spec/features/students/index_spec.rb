require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/students'" do
    it "I see a list of students and the number of professors each student has" do
      professor_1 = Professor.create(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
      )
      professor_2 = Professor.create(
        name: "Severus Snape",
        age: 42,
        specialty: "Potions"
      )
      professor_3 = Professor.create(
        name: "Rubeus Hagrid",
        age: 51,
        specialty: "Care of Magical Creatures"
      )
      student_1 = Student.create(
        name: "Harry Potter",
        age: 16,
        house: "Gryffindor"
      )
      student_2 = Student.create(
        name: "Draco Malfoy",
        age: 16,
        house: "Slytherin"
      )
      student_3 = Student.create(
        name: "Luna Lovegood",
        age: 15,
        house: "Ravenclaw"
      )
      ProfessorStudent.create(
        professor: professor_1,
        student: student_1
      )
      ProfessorStudent.create(
        professor: professor_1,
        student: student_2
      )
      ProfessorStudent.create(
        professor: professor_1,
        student: student_3
      )
      ProfessorStudent.create(
        professor: professor_2,
        student: student_1
      )
      ProfessorStudent.create(
        professor: professor_3,
        student: student_1
      )
      ProfessorStudent.create(
        professor: professor_2,
        student: student_2
      )

      visit '/students'

      within '#student-info' do
        expect(page.all('p')[0]).to have_content("Draco Malfoy: 2")
        expect(page.all('p')[1]).to have_content("Harry Potter: 3")
        expect(page.all('p')[2]).to have_content("Luna Lovegood: 1")
      end
    end
  end
end
