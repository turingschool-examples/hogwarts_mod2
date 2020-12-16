require 'rails_helper'

RSpec.describe 'Students show page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagrid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)


  end

  it "displays professors associated with the student" do
    visit "/students/#{@harry.id}"

    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@hagrid.name)
    expect(page).to have_content(@lupin.name)

  end

  it "displays professors alphabetically" do
    visit "/students/#{@harry.id}"

      expect(page.all('#name')[0]).to have_content("Remus Lupin")
      expect(page.all('#name')[1]).to have_content("Rubeus Hagrid")
      expect(page.all('#name')[2]).to have_content("Severus Snape")

  end
end
