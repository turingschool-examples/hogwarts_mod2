require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit the students index page' do
    it 'has a list of students and number of professors each student has' do
      minerva = Professor.create!({ name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"})
      lupin   = Professor.create!({ name: "Remus Lupin",
                                    age: 38,
                                    specialty: "Lycanthropy"})
      snape   = Professor.create!({ name: "Severus Snape",
                                    age: 38,
                                    specialty: "Potions"})
      harry   = Student.create!({   name: "Harry Potter",
                                    age: 16,
                                    house: "Gryffindor"})
      luna    = Student.create!({   name: "Luna Lovegood",
                                    age: 15,
                                    house: "Ravenclaw"})
      draco   = Student.create!({   name: "Draco Malfoy",
                                    age: 16,
                                    house: "Slytherin"})
      ps_1   = ProfessorStudent.create!({ professor_id: minerva.id,
                                          student_id:   harry.id})
      ps_2   = ProfessorStudent.create!({ professor_id: minerva.id,
                                          student_id:   luna.id})
      ps_3   = ProfessorStudent.create!({ professor_id: minerva.id,
                                          student_id:   draco.id})
      ps_4   = ProfessorStudent.create!({ professor_id: lupin.id,
                                          student_id:   harry.id})
      ps_5   = ProfessorStudent.create!({ professor_id: lupin.id,
                                          student_id:   luna.id})
      ps_6   = ProfessorStudent.create!({ professor_id: snape.id,
                                          student_id:   draco.id})
      ps_7   = ProfessorStudent.create!({ professor_id: snape.id,
                                          student_id:   luna.id})

      visit '/students'

      expect(page).to have_content("#{harry.name}: 2")
      expect(page).to have_content("#{luna.name}: 3")
      expect(page).to have_content("#{draco.name}: 2")
    end
  end
end

describe 'as a visitor' do
  describe 'when I visit the students index page' do
    it 'the content is displayed in alphabetical order' do
    end
  end
end 
