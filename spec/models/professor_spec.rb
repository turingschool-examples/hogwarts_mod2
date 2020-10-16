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

  describe 'instance methods' do
    it '#average_age_of_students' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = snape.students.create(name: "Neville Longbottom" , age: 12 , house: "Gryffindor" )

      expect(snape.average_age_of_students).to eq(11.5)
    end
  end
end
