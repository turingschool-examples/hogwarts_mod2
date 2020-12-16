require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit /students' do
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      @ps_1 = ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      @ps_2 = ProfessorStudent.create(student_id: @harry.id, professor_id: @hagrid.id)
      @ps_3 = ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
      @ps_4 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagrid.id)
      @ps_5 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
      @ps_6 = ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)

    end

    it "I see a list of students and the number of professors each student has" do
      visit '/students'
      
      expect(page).to have_content("Harry Potter: 3")
      expect(page).to have_content("Draco Malfoy: 2")
      expect(page).to have_content("Neville Longbottom: 1")
    end

  end
end
