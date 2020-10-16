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
    before :each do
      @mcgonagall = Professor.create!(
                    name: "Minerva McGonagall",
                    age: 204,
                    specialty: "Transfiguration")
      @snape = Professor.create!(
                    name: "Severus Snape",
                    age: 40,
                    specialty: "Potions")
      @hagrid = Professor.create!(
                    name: "Rubeus Hagrid",
                    age: 46,
                    specialty: "Care of Magical Creatures")

      @longbottom = Student.create!(
        name: "Neville Longbottom",
        age: 14,
        house: "Gryffindor")
      @malfoy = Student.create!(
        name: "Draco Malfoy",
        age: 12,
        house: "Slytherin")
      @potter = Student.create!(
        name: "Harry Potter",
        age: 13,
        house: "Gryffindor")
      ProfessorStudent.create!(professor: @mcgonagall, student: @longbottom)
      ProfessorStudent.create!(professor: @mcgonagall, student: @potter)
      ProfessorStudent.create!(professor: @snape, student: @malfoy)
      ProfessorStudent.create!(professor: @snape, student: @longbottom)
    end

    it ".sort_alpha" do
      expect(Professor.all.sort_alpha.pluck(:name)).to eq(["#{@mcgonagall.name}", "#{@hagrid.name}", "#{@snape.name}"])
    end
  end
end
