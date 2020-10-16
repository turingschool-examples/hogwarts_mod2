require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    snape = Professor.create(name: 'Severus Snape', age: 45, specialty: 'Potions')
    hagarid = Professor.create(name: 'Rubeus Hagrid', age: 38, specialty: 'Care of Magical Creatures')
    lupin = Professor.create(name: 'Remus Lupin', age: 49, specialty: 'Defense Against The Dark Arts')

    harry = Student.create(name: 'Harry Potter', age: 11, house: 'Gryffindor')
    malfoy = Student.create(name: 'Draco Malfoy', age: 12, house: 'Slytherin')
    longbottom = Student.create(name: 'Neville Longbottom', age: 11, house: 'Gryffindor')

    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
    ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
  end

  describe 'When I visit /professors' do
    it 'I see a list of professors with their name, age, and specialty' do
      visit '/professors'

      Professor.all.each do |professor|
        expect(page).to have_content(professor.name)
        expect(page).to have_content(professor.age.to_s)
        expect(page).to have_content(professor.specialty)
      end
    end
  end
end
