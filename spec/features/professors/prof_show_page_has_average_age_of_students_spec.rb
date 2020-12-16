require 'rails_helper'

RSpec.describe 'As a user' do
  before(:each) do
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    ProfessorStudent.create!(professor_id: @lupin.id, student_id: @harry.id)
    ProfessorStudent.create!(professor_id: @lupin.id, student_id: @malfoy.id)

  end
  describe "when I visit a professor's show page" do
    
    it 'has the average age of the their students' do
      visit "/professors/#{@lupin.id}"
     
     expect(page).to have_content("Average Age: 11.5")
    end
  end
end