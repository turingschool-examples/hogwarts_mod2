require 'rails_helper'

describe 'Professor show page' do
  prof_1 = Professor.create(name: 'Billy Bob',
                            age: 953,
                            specialty: 'Beer drinkin')
  prof_2 = Professor.create(name: 'Nicky',
                            age: 5,
                            specialty: 'Vodoo')
  stud_1 = Student.create(name: 'Harry',
                                     age: 23,
                                     house: 'Party')
  stud_2 = Student.create(name: 'Lucy',
                                     age: 2,
                                     house: 'Lazy')
  stud_3 = Student.create(name: 'Tommy',
                                     age: 53,
                                     house: 'Old')
  prof_stud_1 = ProfessorStudent.create(professor_id: prof_1.id,
                                       student_id: stud_1.id)
  prof_stud_2 = ProfessorStudent.create(professor_id: prof_1.id,
                                       student_id: stud_2.id)
  prof_stud_3 = ProfessorStudent.create(professor_id: prof_2.id,
                                       student_id: stud_1.id)

  before do
    visit "/professors/#{prof_1.id}"
  end

  it 'shows all students' do
    expect(page).to have_content("Professor #{prof_1.name}'s Students:")
    expect(page).to have_content(stud_1.name)
    expect(page).to have_content(stud_2.name)
    expect(page).to_not have_content(stud_3.name)
  end

  it 'shows average student age' do
    expect(prof_1.average_student_age).to eq(12.5)
  end
end
