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
    let!(:professor1) { create(:professor) } 
    let!(:professor2) { create(:professor, name: 'Taylor Phillips') } 
    let!(:professor3) { create(:professor, name: 'Mike Jones') } 

    let!(:student1) { create(:student) } 
    let!(:student2) { create(:student, name: "Ron Weasley") } 
    let!(:student3) { create(:student, name: "Luna Lovegood") } 

    let!(:professor_student1) { create(:professor_student, professor_id: professor1.id, student_id: student1.id) } 
    let!(:professor_student2) { create(:professor_student, professor_id: professor1.id, student_id: student2.id) } 
    let!(:professor_student3) { create(:professor_student, professor_id: professor2.id, student_id: student3.id) } 
    let!(:professor_student4) { create(:professor_student, professor_id: professor3.id, student_id: student1.id) } 

    it '.professors' do
      expect(student1.professors).to eq([professor1, professor3])
    end
  end
end
