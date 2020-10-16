require 'rails_helper'

describe 'Student index page' do
  prof_1 = Professor.create(name: 'Billy Bob',
                            age: 953,
                            specialty: 'Beer drinkin')
  prof_2 = Professor.create(name: 'Nicky',
                            age: 5,
                            specialty: 'Vodoo')
  prof_3 = Professor.create(name: 'Shaq',
                            age: 42,
                            specialty: 'Hoopin')
  stud_1 = Student.create(name: 'Harry',
                          age: 23,
                          house: 'Party')
  stud_2 = Student.create(name: 'Lucy',
                          age: 2,
                          house: 'Lazy')
  prof_stud_1 = ProfessorStudent.create(professor_id: prof_1.id,
                                        student_id: stud_1.id)
  prof_stud_2 = ProfessorStudent.create(professor_id: prof_1.id,
                                        student_id: stud_2.id)
  prof_stud_3 = ProfessorStudent.create(professor_id: prof_2.id,
                                        student_id: stud_1.id)

  before do
    visit '/students'
  end

  it 'lists all students and number of professors' do
    expect(page).to have_content("Students and Their Number of Professors:")
    expect(page).to have_content(stud_1.name)
    expect(page).to have_content(stud_2.name)
    expect(stud_1.number_professors).to eq(2)
    expect(stud_2.number_professors).to eq(1)
  end
end
