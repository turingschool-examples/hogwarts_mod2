require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/professors/:id'" do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38, specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49, specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter", age: 9, house: "Gryffindor")
      @malfoy = Student.create(name: "Draco Malfoy", age: 10, house: "Slytherin")
      @longbottom = Student.create(name: "Neville Longbottom", age: 11, house: "Gryffindor")

      ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    end

    it 'I see a list of the names of the students the professors have.' do
      visit professor_path(@snape)

      expect(page).to have_content("#{@snape.name}'s Students")

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@longbottom.name)
    end

    it 'I see the average age of all students for that professor.' do
      visit professor_path(@snape)

      expect(page).to have_content("#{@snape.name}'s Students")

      expect(page).to have_content("Average age: 10")
    end
  end
end