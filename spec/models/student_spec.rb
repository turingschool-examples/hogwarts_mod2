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

  describe 'class methods' do
    describe '::number_of_professors' do
      it 'returns the student and their number of professors' do
        harry = Student.find_by_name("Harry Potter")

        expect(Student.number_of_professors.first[1]).to eq(2)
      end
    end
  end

end
