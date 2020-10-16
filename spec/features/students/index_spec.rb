require 'rails_helper'

describe 'As a visitor' do
  describe 'When I vist the student index' do
    it 'I can see a list of students and the number of professors each student has' do
      @mcgonagall = Professor.create!(
        name: 'Minerva McGonagall',
        age: 204,
        specialty: 'transfiguration'
      )
      @snape = Professor.create!(
        name: 'Severus Snape',
        age: 38,
        specialty: 'potions'
      )
      @flitwick = Professor.create!(
        name: 'Filius Flitwick',
        age: 85,
        specialty: 'spells and charms'
      )
      @sprout = Professor.create!(
        name: 'Pomona Sprout',
        age: 87,
        specialty: 'herbology'
      )
      @black = Student.create!(
              name: 'Casseopia Black',
              age: 14,
              house: 'Slytherin'
            )
      @wood = Student.create!(
              name: 'Oliver Wood',
              age: 15,
              house: 'Gryffindor'
            )
      @lovegood = Student.create!(
              name: 'Luna Lovegood',
              age: 15,
              house: 'Ravenclaw'
            )
      @diggory = Student.create!(
              name: 'Cedric Diggory',
              age: 16,
              house: 'Hufflepuff'
            )

      ProfessorStudent.create!(student: @black, professor: @mcgonagall)
      ProfessorStudent.create!(student: @wood, professor: @mcgonagall)
      ProfessorStudent.create!(student: @diggory, professor: @mcgonagall)
      ProfessorStudent.create!(student: @black, professor: @snape)
      ProfessorStudent.create!(student: @wood, professor: @snape)
      ProfessorStudent.create!(student: @lovegood, professor: @snape)
      ProfessorStudent.create!(student: @diggory, professor: @snape)
      ProfessorStudent.create!(student: @black, professor: @flitwick)
      ProfessorStudent.create!(student: @wood, professor: @flitwick)
      ProfessorStudent.create!(student: @lovegood, professor: @flitwick)
      ProfessorStudent.create!(student: @diggory, professor: @flitwick)
      ProfessorStudent.create!(student: @lovegood, professor: @sprout)
      ProfessorStudent.create!(student: @diggory, professor: @sprout)

      visit '/students'
      expect(page).to have_content(@black.name)
      expect(page).to have_content(@wood.name)
      expect(page).to have_content(@diggory.name)
      expect(page).to have_content(@lovegood.name)
      expect(page).to have_content(@black.professors.count)
      expect(page).to have_content(@wood.professors.count)
      expect(page).to have_content(@diggory.professors.count)
      expect(page).to have_content(@lovegood.professors.count)
      expect(page).to have_content('Casseopia Black: 3')
      expect(page).to have_content('Oliver Wood: 3')
      expect(page).to have_content('Luna Lovegood: 3')
      expect(page).to have_content('Cedric Diggory: 4')
      save_and_open_page
    end
  end
end
