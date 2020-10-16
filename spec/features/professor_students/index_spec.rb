require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have." do
      prof_1 = Professor.create({
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
        })

      prof_2 = Professor.create({
        name: "Severus Snape",
        age: 38,
        specialty: "Dark Arts"
        })

      prof_3 = Professor.create({
        name: "Sybill Trelawney",
        age: 36,
        specialty: "Seer"
        })

      student_1 = Student.create!({name: "Neville Longbottom"})
      student_2 = Student.create!({name: "Hermione Granger"})
      student_3 = Student.create!({name: "Luna Lovegood"})
      student_4 = Student.create!({name: "Harry Potter"})
      student_5 = Student.create!({name: "Ron Weasley"})

      ProfessorStudents.create!(student: student1, professor: prof_1)
      ProfessorStudents.create!(student: student1, professor: prof_2)
      ProfessorStudents.create!(student: student2, professor: prof_1)
      ProfessorStudents.create!(student: student2, professor: prof_2)
      ProfessorStudents.create!(student: student2, professor: prof_3)
      ProfessorStudents.create!(student: student3, professor: prof_1)
      ProfessorStudents.create!(student: student3, professor: prof_3)
      ProfessorStudents.create!(student: student4, professor: prof_2)
      ProfessorStudents.create!(student: student4, professor: prof_3)
      ProfessorStudents.create!(student: student5, professor: prof_1)
      ProfessorStudents.create!(student: student5, professor: prof_2)

      visit "/professors/#{:id}"

      within("#professor-#{prof_1.id}") do
        expect(page).to have_content(student_1.name)
        expect(page).to have_content(student_2.name)
        expect(page).to have_content(student_3.name)
        expect(page).to have_content(student_5.name)
      end

      within("#professor-#{prof_2.id}") do
        expect(page).to have_content(student_1.name)
        expect(page).to have_content(student_2.name)
        expect(page).to have_content(student_4.name)
        expect(page).to have_content(student_5.name)
      end

      within("#professor-#{prof_3.id}") do
        expect(page).to have_content(student_2.name)
        expect(page).to have_content(student_3.name)
        expect(page).to have_content(student_4.name)
      end
    end
  end
end