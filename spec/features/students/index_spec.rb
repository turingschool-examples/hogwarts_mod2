require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/students'" do
    it "I see a list of students and the number of professors each student has." do
      professor_1 = Professor.create(
        name: "Severus Snape",
        age: 45,
        specialty: "Betrayal"
      )
      professor_2 = Professor.create(
        name: "Helena Handbasket",
        age: 50,
        specialty: "Witches Studies"
      )
      professor_3 = Professor.create(
        name: "Albus Dumbledore",
        age: 136,
        specialty: "Everything"
      )
      student_1 = Student.create(
        name: "Jake Potter",
        age: 34,
        house: "Ravenclaw"
      )
      student_2 = Student.create(
        name: "Tommy Hogwarts",
        age: 12,
        house: "Gryffindor"
      )
      student_3 = Student.create(
        name: "Jane Magic",
        age: 15,
        house: "Hufflepuff"
      )
      prof_stdnt_1 = ProfessorStudent.create(
        professor_id: professor_1.id,
        student_id: student_1.id
      )
      prof_stdnt_2 = ProfessorStudent.create(
        professor_id: professor_2.id,
        student_id: student_1.id
      )
      prof_stdnt_3 = ProfessorStudent.create(
        professor_id: professor_3.id,
        student_id: student_1.id
      )
      prof_stdnt_4 = ProfessorStudent.create(
        professor_id: professor_1.id,
        student_id: student_2.id
      )
      prof_stdnt_5 = ProfessorStudent.create(
        professor_id: professor_3.id,
        student_id: student_2.id
      )
      prof_stdnt_6 = ProfessorStudent.create(
        professor_id: professor_2.id,
        student_id: student_3.id
      )
      prof_stdnt_7 = ProfessorStudent.create(
        professor_id: professor_1.id,
        student_id: student_3.id
      )

      visit "/students"

      expect(page).to have_content("#{student_1.name}: 3")
      expect(page).to have_content("#{student_2.name}: 2")
      expect(page).to have_content("#{student_3.name}: 2")
    end
  end
end
