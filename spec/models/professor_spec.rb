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
    
    describe '::average_age' do
      it 'averages the ages of the students' do
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

        students = [harry, malfoy]

        expect(Professor.average_age(students)).to eq(11.5)
      end
    end
  end
end
