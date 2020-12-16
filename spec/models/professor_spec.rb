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
    describe 'sort_alphabetically' do
      it 'should return the professors in alphabetical order' do
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

        expect(Professor.sort_alphabetically_by_name).to eq([lupin, hagarid, snape])
      end
    end
  end
end
