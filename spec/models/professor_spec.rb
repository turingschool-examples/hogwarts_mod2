require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance_methods' do
    it 'student_average_age' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      digory = Student.create(name: "Cedric Digory" , age: 14 , house: "Huffle Puff" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: digory.id, professor_id: snape.id)

      expect(snape.student_average_age).to eq(12)

      chang = Student.create(name: "Cho Chang" , age: 13 , house: "Ravenclaw" )
      ProfessorStudent.create(student_id: chang.id, professor_id: snape.id)

      expect(snape.student_average_age).to eq(12.2)
    end
  end
end
