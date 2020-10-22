require 'rails_helper'

describe "As a visitor" do
  before :each do
    @snape = Professor.create!(
                        name: "Severus Snape",
                        age: 45,
                        specialty: "Potions")
    @hagrid = Professor.create!(
                        name: "Rubeus Hagrid",
                        age: 38 ,
                        specialty: "Care of Magical Creatures")
    @lupin = Professor.create!(
                        name: "Remus Lupin",
                        age: 49 ,
                        specialty: "Defense Against The Dark Arts")
    @harry = Student.create!(
                      name: "Harry Potter" ,
                      age: 11 ,
                      house: "Gryffindor" )
    @malfoy = Student.create!(
                      name: "Draco Malfoy" ,
                      age: 12 ,
                      house: "Slytherin" )
    @longbottom = Student.create!(
                      name: "Neville Longbottom" ,
                      age: 11 ,
                      house: "Gryffindor" )
    ProfessorStudent.create!(
                        student_id: @harry.id,
                        professor_id: @snape.id)
    ProfessorStudent.create!(
                        student_id: @harry.id,
                        professor_id: @hagrid.id)
    ProfessorStudent.create!(
                        student_id: @harry.id,
                        professor_id: @lupin.id)
    ProfessorStudent.create!(
                        student_id: @malfoy.id,
                        professor_id: @hagrid.id)
    ProfessorStudent.create!(
                        student_id: @malfoy.id,
                        professor_id: @lupin.id)
    ProfessorStudent.create!(
                        student_id: @longbottom.id,
                        professor_id: @snape.id)
  end

  describe "when I visit '/students'" do
    it "I see a list of students and the number of professors each student has. (e.g. 'Draco Malfoy: 5', 'Nymphadora Tonks: 10')" do
      visit '/students'

      expect(page).to have_css('.student', count: 3)

      within "#student-#{@harry.id}" do
        expect(page).to have_content("#{@harry.name}: #{@harry.professor_count}")
      end

      within "#student-#{@malfoy.id}" do
        expect(page).to have_content("#{@malfoy.name}: #{@malfoy.professor_count}")
      end

      within "#student-#{@longbottom.id}" do
        expect(page).to have_content("#{@longbottom.name}: #{@longbottom.professor_count}")
      end
      end
    end

    describe "when I visit '/students'" do
      it "lists students alphabetically" do
        visit '/students'

        within all('.student')[0] do
          expect(page).to have_content(@malfoy.name)
        end
        within all('.student')[1] do
          expect(page).to have_content(@harry.name)
        end
        within all('.student')[2] do
          expect(page).to have_content(@longbottom.name)
        end
        end
      end
end
