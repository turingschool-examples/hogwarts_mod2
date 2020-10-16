require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit a professors show page' do
  before :each do
    @mcgonagall = Professor.create!(
                  name: "Minerva McGonagall",
                  age: 204,
                  specialty: "Transfiguration")
    @snape = Professor.create!(
                  name: "Severus Snape",
                  age: 40,
                  specialty: "Potions")

    @longbottom = Student.create!(
      name: "Neville Longbottom",
      age: 14,
      house: "Gryffindor")
    @malfoy = Student.create!(
      name: "Draco Malfoy",
      age: 12,
      house: "Slytherin")
    @potter = Student.create!(
      name: "Harry Potter",
      age: 13,
      house: "Gryffindor")
    ProfessorStudent.create!(professor: @mcgonagall, student: @longbottom)
    ProfessorStudent.create!(professor: @mcgonagall, student: @potter)
    ProfessorStudent.create!(professor: @snape, student: @malfoy)
    ProfessorStudent.create!(professor: @snape, student: @longbottom)
    ProfessorStudent.create!(professor: @snape, student: @potter)
  end

    it "Shows a list of students the professor has" do
      visit "/professors/#{@mcgonagall.id}"

      expect(page).to have_content("#{@longbottom.name}")
      expect(page).to have_content("#{@potter.name}")
      expect(page).to_not have_content("#{@malfoy.name}")
    end
    it "Shows the average age of all students for that prof" do
      visit "/professors/#{@snape.id}"

      expect(page).to have_content("Average Age: #{@snape.students.average_age}")
    end

    it "Shows a list of students the prof has alphabetically" do
      visit "/professors/#{@snape.id}"

      expect(page.all('li')[0]).to have_content("#{@malfoy.name}")
      expect(page.all('li')[1]).to have_content("#{@potter.name}")
      expect(page.all('li')[2]).to have_content("#{@longbottom.name}")
    end

  end
end
