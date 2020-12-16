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
  # User Story 2
  it 'Can list the names of professors students' do
    expect(@snape.student_names).to eq(['Harry Potter', 'Neville Longbottom'])
    expect(@lupin.student_names).to eq(['Harry Potter', 'Draco Malfoy'])
  end
end
