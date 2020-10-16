require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/professors/:id"do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)

    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
  end
    it "I see a list of of the name of students the professors have" do
      visit "/professors/#{@snape.id}"

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@longbottom.name)
      expect(page).to_not have_content(@malfoy.name)
    end
  end
end
