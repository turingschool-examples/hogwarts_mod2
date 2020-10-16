require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @snape = Professor.create(name: 'Severus Snape', age: 45, specialty: 'Potions')
    @hagarid = Professor.create(name: 'Rubeus Hagrid', age: 38, specialty: 'Care of Magical Creatures')
    @lupin = Professor.create(name: 'Remus Lupin', age: 49, specialty: 'Defense Against The Dark Arts')

    @harry = Student.create(name: '@Harry Potter', age: 11, house: 'Gryffindor')
    @malfoy = Student.create(name: 'Draco Malfoy', age: 12, house: 'Slytherin')
    @longbottom = Student.create(name: 'Neville Longbottom', age: 11, house: 'Gryffindor')

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  describe "When I visit '/professors/:id' " do
    it 'I see the average age of all students for that professor' do
      visit "/professors/#{@snape.id}"

      expect(page).to have_content(((@harry.age + @longbottom.age) / 2).to_s)

      visit "/professors/#{@hagarid.id}"

      expect(page).to have_content(((@harry.age + @malfoy.age) / 2).to_s)

      visit "/professors/#{@lupin.id}"

      expect(page).to have_content(@harry.age.to_s)
    end
  end
end
