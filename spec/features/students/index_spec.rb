require 'rails_helper'

describe 'As a visitor' do
  before :each do
      @professor1 = Professor.create(name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration")

      @professor2 = Professor.create(name: "Severus Snape",
                                    age: 50,
                                    specialty: "Potions")

      @student1 = @professor1.students.create!(name: "Hermione Granger",
                                              age: "12",
                                              house: "Gryffindor")

      @student2 = @professor1.students.create!(name: "Harry Potter",
                                              age: "11",
                                              house: "Gryffindor")
      @professor2.students << @student2
  end

  describe 'when I visit /students' do
    it 'I see a list of students and the number of professors each student has' do
      visit '/students'
      
      expect(page).to have_content("#{@student1.name}: 1")
      expect(page).to have_content("#{@student2.name}: 2")
    end

    it "lists students alphabetically by name" do
      visit '/students'

      within('.students-index') do
        expect(page.all('p')[0]).to have_content(@student2.name)
        expect(page.all('p')[1]).to have_content(@student1.name)
      end
    end
  end
end
