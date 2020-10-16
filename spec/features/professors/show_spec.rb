require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall",
                                   age: 204,
                                   specialty: "Transfiguration")

    @student1 = @professor1.students.create!(name: "Harry Potter",
                                             age: "11",
                                             house: "Gryffindor")
    @student2 = @professor1.students.create!(name: "Draco Malfoy",
                                             age: "12",
                                             house: "Slytherin")
  end

  describe 'when I visit a professors show page' do
    it 'I should see the names of all the students that professor has' do
      visit "/professors/#{@professor1.id}"

      expect(page).to have_content(@student1.name)
      expect(page).to have_content(@student2.name)
    end

    it 'I should see the average age of that professors students' do
      visit "/professors/#{@professor1.id}"

      expect(page).to have_content("Average student age: 11.5")
    end

    it 'I see the students ordered by name' do
      visit "/professors/#{@professor1.id}"

      within('#professor-students') do
        expect(page.all('p')[0]).to have_content(@student2.name)
        expect(page.all('p')[1]).to have_content(@student1.name)
      end
    end
  end
end
