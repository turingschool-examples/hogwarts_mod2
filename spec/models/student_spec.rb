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

  describe "instance method" do #specific student vs. class methos for all students
    it '#professor_count' do
      snape = Professor.create!(
                          name: "Severus Snape",
                          age: 45,
                          specialty: "Potions")
      hagrid = Professor.create!(
                          name: "Rubeus Hagrid",
                          age: 38 ,
                          specialty: "Care of Magical Creatures")
      lupin = Professor.create!(
                          name: "Remus Lupin",
                          age: 49 ,
                          specialty: "Defense Against The Dark Arts")
      harry = Student.create!(
                        name: "Harry Potter" ,
                        age: 11 ,
                        house: "Gryffindor" )

      ProfessorStudent.create!(
                          student_id: harry.id,
                          professor_id: snape.id)
      ProfessorStudent.create!(
                          student_id: harry.id,
                          professor_id: hagrid.id)
      ProfessorStudent.create!(
                          student_id: harry.id,
                          professor_id: lupin.id)

      expect(harry.professor_count).to eq(3)
    end
  end

end
