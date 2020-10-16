require 'rails_helper'

describe 'Professor index page' do
  prof_1 = Professor.create(name: 'Billy Bob',
                            age: 953,
                            specialty: 'Beer drinkin')
  prof_2 = Professor.create(name: 'Nicky',
                            age: 5,
                            specialty: 'Vodoo')
  stud_1 = prof_1.students.create(name: 'Harry',
                                     age: 23,
                                     house: 'Party')
  stud_2 = prof_1.students.create(name: 'Lucy',
                                     age: 2,
                                     house: 'Lazy')
  stud_3 = prof_2.students.create(name: 'Tommy',
                                     age: 53,
                                     house: 'Old')

  before do
    visit "/professors/#{prof_1.id}"
  end

  it 'shows all students' do
    expect(page).to have_content("Professor #{prof_1.name}'s Students:")
    expect(page).to have_content(stud_1.name)
    expect(page).to have_content(stud_1.age)
    expect(page).to have_content(stud_1.house)
    expect(page).to have_content(stud_2.name)
    expect(page).to have_content(stud_2.age)
    expect(page).to have_content(stud_2.house)
    expect(page).to_not have_content(stud_3.name)
    expect(page).to_not have_content(stud_3.age)
    expect(page).to_not have_content(stud_3.house)
  end
end
