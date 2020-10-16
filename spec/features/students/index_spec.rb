require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/students'" do
    before(:each) do
      @prof_1 = Professor.create({
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
        })

      @prof_2 = Professor.create({
        name: "Severus Snape",
        age: 38,
        specialty: "Dark Arts"
        })

      @prof_3 = Professor.create({
        name: "Sybill Trelawney",
        age: 36,
        specialty: "Seer"
        })

      @student_1 = Student.create!({
        name: "Neville Longbottom",
        age: 18,
        house: "Gryffindor"})
      @student_2 = Student.create!({
        name: "Hermione Granger",
        age: 19,
        house: "Gryffindor"})
      @student_3 = Student.create!({
        name: "Luna Lovegood",
        age: 18,
        house: "Ravenclaw"})
      @student_4 = Student.create!({
        name: "Harry Potter",
        age: 19,
        house: "Gryffindor"})
      @student_5 = Student.create!({
        name: "Ron Weasley",
        age: 18,
        house: "Gryffindor"})

      @prof_1.professor_students.create(student: @student_1)
      @prof_1.professor_students.create(student: @student_2)
      @prof_1.professor_students.create(student: @student_3)
      @prof_1.professor_students.create(student: @student_5)
      @prof_2.professor_students.create(student: @student_1)
      @prof_2.professor_students.create(student: @student_2)
      @prof_2.professor_students.create(student: @student_4)
      @prof_2.professor_students.create(student: @student_5)
      @prof_3.professor_students.create(student: @student_2)
      @prof_3.professor_students.create(student: @student_3)
      @prof_3.professor_students.create(student: @student_4)
    end

    it "I see a list of students and the number of professors they have" do
      visit '/students'

      expect(page).to have_content("Teachers per Student")
      expect(page).to have_content("Neville Longbottom: 2")
      expect(page).to have_content("Hermione Granger: 3")
      expect(page).to have_content("Luna Lovegood: 2")
      expect(page).to have_content("Harry Potter: 2")
      expect(page).to have_content("Ron Weasley: 2")
    end
  end
end