require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'instance methods' do
    describe 'average_student_age' do
      it 'should return the average age of a professors students' do
        @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
        @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

        @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        @malfoy = Student.create!(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        @longbottom = Student.create!(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

        ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
        ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
        ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)

        expect(@lupin.average_student_age).to eq(@malfoy.age)
        expect(@snape.average_student_age).to eq((@harry.age + @longbottom.age) / 2)
      end
    end
  end
end
