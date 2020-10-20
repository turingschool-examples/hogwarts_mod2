require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have.
    (e.g. 'Neville Longbottom'
          'Hermione Granger'
          'Luna Lovegood')" do
      lupin = Professor.create(
                          name: "Remus Lupin",
                          age: 49 ,
                          specialty: "Defense Against The Dark Arts")
      harry = Student.create(
                        name: "Harry Potter" ,
                        age: 11 ,
                        house: "Gryffindor" )
      malfoy = Student.create(
                        name: "Draco Malfoy" ,
                        age: 12 ,
                        house: "Slytherin" )
      ProfessorStudent.create(
                          student_id: harry.id,
                          professor_id: lupin.id)
      ProfessorStudent.create(
                          student_id: malfoy.id,
                          professor_id: lupin.id)

      visit "/professors/#{lupin.id}"

      within '.students' do
        expect(page).to have_css('.name')
      end

      expect(page).to have_content("#{harry.name}")
      expect(page).to have_content("#{malfoy.name}")
    end
  end
end
