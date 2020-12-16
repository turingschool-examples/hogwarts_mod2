require 'rails_helper'

RSpec.describe 'the students show page' do
  before :each do
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
  end

  it "displays a list of all the students attributes" do
    visit "/students/#{@harry.id}"

    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@harry.age)
    expect(page).to have_content(@harry.house)
  end
end
