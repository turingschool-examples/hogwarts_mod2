require 'rails_helper'

RSpec.describe 'Students Index Page' do
  describe 'As a visitor' do
    before :each do
      @professor_1 = Professor.create!(
        name: 'Cuthbert Binns',
        age: 124,
        specialty: 'History of Magic'
      )
      @professor_2 = Professor.create!(
        name: 'Firenze',
        age: 285,
        specialty: 'Divination'
      )
      @student_1 = Student.create!(
        name: 'Blaise Zabini',
        age: 14,
        house: 'Hufflepuff'
      )
      @student_2 = Student.create!(
        name: 'Parvati Patil',
        age: 12,
        house: 'Slytherin'
      )
      @student_3 = Student.create!(
        name: 'Marietta Edgecombe',
        age: 11,
        house: 'Ravenclaw'
      )
      @student_4 = Student.create!(
        name: 'Penelope Clearwater',
        age: 12,
        house: 'Hufflepuff'
      )
      ProfessorStudent.create!(
        professor: @professor_1,
        student: @student_1
      )
      ProfessorStudent.create!(
        professor: @professor_1,
        student: @student_2
      )
      ProfessorStudent.create!(
        professor: @professor_1,
        student: @student_3
      )
      ProfessorStudent.create!(
        professor: @professor_2,
        student: @student_4
      )
      ProfessorStudent.create!(
        professor: @professor_2,
        student: @student_1
      )
    end
    it 'can see a list of students and total professors for each student' do
      visit '/students'


      expect(page).to have_content(@student_1.name)
      expect(page).to have_content('2')

      expect(page).to have_content(@student_2.name)
      expect(page).to have_content('1')

      expect(page).to have_content(@student_3.name)
      expect(page).to have_content('1')

      expect(page).to have_content(@student_4.name)
      expect(page).to have_content('1')
    end
  end
end
