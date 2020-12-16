require 'rails_helper'

RSpec.describe "Students Index" do
  before :each do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    @students = Student.all

    ProfessorStudent.create(student_id: @harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: snape.id)
  end

  it 'has a list of students' do
    visit students_path

    @students.each do |student|
      expect(page).to have_css("#student-#{student.id}")
    end
  end

  it 'shows the number of professors each student has' do
    visit students_path

    @students.each do |student|
      within("#student-#{student.id}") do
        expect(page).to have_content("#{student.name}: #{student.professor_count}")
      end
    end
  end

  it 'lists students in alphabetical order' do
    visit students_path

    expect(@malfoy.name).to appear_before(@harry.name)
    expect(@harry.name).to appear_before(@longbottom.name)
  end
end
