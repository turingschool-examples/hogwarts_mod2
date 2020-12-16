require 'rails_helper'

RSpec.describe 'Professors show page' do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 12 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)

  end

  it "displays students associated with the professor" do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)

  end

  it "displays the average age of students" do
    visit "/professors/#{@snape.id}"

    expect(page).to have_content(11.5)
  end

  xit "displays students alphabetically" do
    visit "/professors/#{@snape.id}"

    within '#name' do
      expect(page.all('.name')[0]).to have_content("Harry Potter")
      expect(page.all('.name')[1]).to have_content("Neville Longbottom")
    end
  end
end
