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

    describe 'instance method' do
    it "can count average age of professors students" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      snape.students << harry
      snape.students << longbottom

     expect(snape.average_student_age).to eq(11)
   end
  end
end
