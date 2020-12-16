require 'rails_helper'

RSpec.describe "Professor Show Page" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 15 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  describe "When I visit a particular professor showpage" do
    it "shows a list of the names of the professor's students" do

      visit "professors/#{@snape.id}"

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@longbottom.name)
    end

    it "shows the average age of all students for that professor" do
      visit "professors/#{@snape.id}"
      expect(page).to have_content("Average Student Age: #{@snape.average_student_age}")
    end
  end
end
