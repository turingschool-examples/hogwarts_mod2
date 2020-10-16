require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
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
        age: 14,
        house: "Gryffindor"})
      @student_2 = Student.create!({
        name: "Hermione Granger",
        age: 16,
        house: "Gryffindor"})
      @student_3 = Student.create!({
        name: "Luna Lovegood",
        age: 18,
        house: "Ravenclaw"})
      @student_4 = Student.create!({
        name: "Harry Potter",
        age: 16,
        house: "Gryffindor"})
      @student_5 = Student.create!({
        name: "Ron Weasley",
        age: 17,
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

    it "I see a list of the names of the students the professors have." do

      visit "/professors/#{@prof_1.id}"

      expect(page).to have_content("#{@prof_1.name}: Student Roster")

      expect(page).to have_content("#{@student_1.name}")
      expect(page).to have_content("#{@student_3.name}")
      expect(page).to have_content("#{@student_2.name}")
      expect(page).to have_content("#{@student_5.name}")
    end

    it "I see a list of the names of the students the professors have." do

      visit "/professors/#{@prof_2.id}"

      expect(page).to have_content("#{@prof_2.name}: Student Roster")

      expect(page).to have_content("#{@student_1.name}")
      expect(page).to have_content("#{@student_4.name}")
      expect(page).to have_content("#{@student_2.name}")
      expect(page).to have_content("#{@student_5.name}")
    end

    it "I see a list of the names of the students the professors have." do

      visit "/professors/#{@prof_3.id}"

      expect(page).to have_content("#{@prof_3.name}: Student Roster")

      expect(page).to have_content("#{@student_2.name}")
      expect(page).to have_content("#{@student_3.name}")
      expect(page).to have_content("#{@student_4.name}")
    end

    it "I see the averageage of all students for that professor" do
      visit "/professors/#{@prof_1.id}"

      expect(page).to have_content("Average age: 16.2")
    end
  end
end