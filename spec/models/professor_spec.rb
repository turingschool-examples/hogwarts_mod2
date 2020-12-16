require 'rails_helper'

RSpec.describe Professor, type: :model do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
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
  describe 'instance variables' do 
    it "can list out a professor's full info into one string" do
      professor_info = "Name: #{@snape.name}, Age: #{@snape.age}, Specialty: #{@snape.specialty}"
      expect(@snape.full_info).to eq(professor_info)
    end
  end
end
