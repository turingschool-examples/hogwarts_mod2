require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /students' do
    before(:each) do
      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    end

    it "I see a list of students with information" do
      visit '/students'

      expect(page).to have_content(@longbottom.name)
      expect(page).to have_content(@longbottom.age)
      expect(page).to have_content(@longbottom.house)
      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@malfoy.age)
    end

    it "I see the list in alphabetical order" do
      visit '/students'

      expect(page.all('li')[0]).to have_content(@malfoy.name)
      expect(page.all('li')[1]).to have_content(@harry.name)
      expect(page.all('li')[2]).to have_content(@longbottom.name)
    end
  end
end
