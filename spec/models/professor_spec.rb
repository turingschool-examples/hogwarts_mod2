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
    end

    it ".sort_alpha" do
      expect(Professor.all.sort_alpha.pluck(:name)).to eq(["#{@mcgonagall.name}", "#{@hagrid.name}", "#{@snape.name}"])

      expect(Professor.all.sort_alpha.pluck(:name)).to_not eq(["#{@snape.name}", "#{@hagrid.name}", "#{@mcgonagall.name}"])
    end
  end
end
