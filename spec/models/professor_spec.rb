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

  describe 'class methods' do
    it '#sorted_by_alphabet' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      expect(Professor.all).to eq([snape, hagarid, lupin])
      expect(Professor.sorted_by_alphabet).to eq([lupin, hagarid, snape])
    end
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
