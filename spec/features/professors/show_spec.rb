require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @professor1 = Professor.create(name: "Minerva McGonagall",
                                   age: 204,
                                   specialty: "Transfiguration")

    @student1 = @professor1.students.create!(name: "Harry Potter",
                                             age: "11",
                                             house: "Gryffindor")
    @student2 = @professor1.students.create!(name: "Hermione Granger",
                                             age: "12",
                                             house: "Gryffindor")
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
  end
end
