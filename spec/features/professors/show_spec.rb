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
    describe "When I visit professors show page" do
        it "displays a list of student names" do
            
            visit "/professors/#{@minerva.id}"

            expect(page).to have_content(@hermione.name)
            expect(page).to have_content(@neville.name)
            expect(page).to_not have_content(@luna.name)
            
            expect(page).to have_content("Average Age: #{@minerva.avg_student_age}")
        end
    end
end