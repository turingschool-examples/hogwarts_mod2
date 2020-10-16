require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe "class methods" do
    it "can find students' average age" do
      @student_1 = Student.create!({
        name: "Neville Longbottom",
        age: 14,
        house: "Gryffindor"})
      @student_2 = Student.create!({
        name: "Hermione Granger",
        age: 16,
        house: "Gryffindor"})
      @student_3 = Student.create!({
        name: "Luna Lovegood",
        age: 18,
        house: "Ravenclaw"})
      @student_5 = Student.create!({
        name: "Ron Weasley",
        age: 17,
        house: "Gryffindor"})

      expect(Student.average_age).to eq(16.25)
    end
  end
end
