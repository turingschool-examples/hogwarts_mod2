require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have" do
      professor_1 = Professor.create(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
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

      visit "professors/#{professor_1.id}"

      within '#professor-student-info' do
        expect(page.all('p')[0]).to have_content("Draco Malfoy")
        expect(page.all('p')[1]).to have_content("Harry Potter")
        expect(page.all('p')[2]).to have_content("Luna Lovegood")
      end
    end
  end
end

describe "As a visitor," do
  describe "When I visit '/professors/:id'" do
    it "I see the average age of all students for that professor" do
      professor_1 = Professor.create(
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
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

      visit "/professors/#{professor_1.id}"

      within '#average-age' do
        expect(page.all('p')[0]).to have_content("Average Age: 15.7")
      end
    end
  end
end
