require 'rails_helper'

RSpec.describe Professor, type: :model do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 14 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 11 , house: "Slytherin" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it '#student_names' do
      expect(@snape.student_names).to eq([@harry.name, @longbottom.name])
    end

    it 'calculates the average student age' do
      expect(@snape.average_student_age).to eq(12.5)
    end
  end
end
