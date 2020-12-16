require 'rails_helper'

RSpec.describe "As a visitor" do
    before :each do
        @minerva = Professor.create!(name: 'Minerva McGonagall', age: 80, specialty: 'Transfiguration')
        @albus = Professor.create!(name: 'Albus Dumbledore', age: 106, specialty: 'Dark Arts')

        @neville = Student.create!(name: "Neville Longbottom", age: 9, house: 'Gryffindor')
        @hermione = Student.create!(name: "Hermione Granger", age: 9, house: 'Gryffindor')
        @luna = Student.create!(name: "Luna Lovegood", age: 10, house: 'Ravenclaw')

        ProfessorStudent.create!(professor: @minerva, student: @hermione)
        ProfessorStudent.create!(professor: @minerva, student: @neville)
        ProfessorStudent.create!(professor: @albus, student: @hermione)
        ProfessorStudent.create!(professor: @albus, student: @luna)
    end
    describe "When I visit professors index page" do
        it "displays a list of professors, alphabetically, and their data" do
            
            visit '/professors'
            save_and_open_page
            expect(page).to have_content(@minerva.name)
            expect(page).to have_content(@minerva.age)
            expect(page).to have_content(@minerva.specialty)
            expect(page).to have_content(@albus.name)
            expect(page).to have_content(@albus.age)
            expect(page).to have_content(@albus.specialty)
        end
    end
end