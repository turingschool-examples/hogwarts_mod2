require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit a professors show page' do
    it 'has a list of names of students the professors have' do
      minerva = Professor.create!({ name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"})
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

      visit "/professors/#{minerva.id}"

      expect(page).to have_content(harry.name)
      expect(page).to have_content(luna.name)
      expect(page).to have_content(draco.name)
    end
  end
end

describe 'as a visitor' do
  describe 'when I visit a professors show page'do
    it 'has the average age of all students for that professor' do
      minerva = Professor.create!({ name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"})
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

      visit "/professors/#{minerva.id}"

      expect(page).to have_content("Average Age: #{Student.average(:age).round}")
    end
  end
end
