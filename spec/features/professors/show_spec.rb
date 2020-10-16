require 'rails_helper'

describe 'professors show page' do
  let!(:professor1) { create(:professor) } 
  let!(:professor2) { create(:professor, name: 'Taylor Phillips') } 

  let!(:student1) { create(:student) } 
  let!(:student2) { create(:student, name: "Ron Weasley") } 
  let!(:student3) { create(:student, name: "Luna Lovegood") } 

  let!(:professor_student1) { create(:professor_student, professor_id: professor1.id, student_id: student1.id) } 
  let!(:professor_student2) { create(:professor_student, professor_id: professor1.id, student_id: student2.id) } 
  let!(:professor_student3) { create(:professor_student, professor_id: professor2.id, student_id: student3.id) } 

  before do
    visit "professors/#{professor1.id}"
  end

  it 'can see title' do
    expect(page).to have_content("#{professor1.name}'s Students")
  end

  it 'can see professors students' do
    expect(page).to have_content("#{student1.name}")
    expect(page).to have_content("#{student2.name}")
  end
end
