require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    @ps_1 = ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    @ps_2 = ProfessorStudent.create(student_id: @harry.id, professor_id: @hagrid.id)
    @ps_3 = ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    @ps_4 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagrid.id)
    @ps_5 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    @ps_6 = ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'professor_count' do
    it "outputs total number of professors the student has" do
      expect(@malfoy.professor_count).to eq(2)
    end
  end

end
