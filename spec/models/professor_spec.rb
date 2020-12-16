require 'rails_helper'

RSpec.describe Professor, type: :model do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
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
    it 'can get the average age of all students under specific professor' do
      harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = @snape.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      expect(@snape.students_avg_age).to eq((11 + 12 + 11) / 3)
    end
    it 'can alphabetically order students' do
      @longbottom = @snape.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      expect(@snape.order_students_alpha).to eq([@malfoy, @harry, @longbottom])
    end
  end
end
