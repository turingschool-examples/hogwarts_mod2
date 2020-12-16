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

  describe 'Class Methods' do
    describe '::find_students' do
      it "finds the students in the professors class" do
        snape =  Professor.find_by_name("Severus Snape")
        
        expected = Professor.find_students(snape.id.to_s).first
        
        expect(expected.select(:name)[0].name).to eq("Harry Potter")
      end
    end
  end
end
