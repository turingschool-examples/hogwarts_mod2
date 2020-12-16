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

  describe 'order_names' do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    end
    
    it "should sort name alphabetically" do
      ordered = Professor.order_names

      expect(ordered).to eq([@lupin, @hagarid, @snape])
    end
  end

  describe 'average_student_age' do
    before :each do
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
  
      ProfessorStudent.create!(professor_id: @lupin.id, student_id: @harry.id)
      ProfessorStudent.create!(professor_id: @lupin.id, student_id: @malfoy.id)
    end

    it 'returns the average age of a professors students' do
      avg = @lupin.average_student_age

      expect(avg).to eq(((@harry.age + @malfoy.age).to_f / 2))
    end

  end
end
