require 'rails_helper'

describe 'students index page' do
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

  before do
    visit '/students'
  end

  it 'can see title' do
    expect(page).to have_content('Hogwarts Students')
  end

  it 'can see all students and number of professors each student has' do
    expect(page).to have_content(student1.name)
    expect(page).to have_content(student2.name)
    expect(page).to have_content(student3.name)

    expect(page).to have_content(student3.professors.count)
    expect(page).to have_content(student3.professors.count)
    expect(page).to have_content(student3.professors.count)
  end
end
