require 'rails_helper'

RSpec.describe "Professors Index" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    @professors = Professor.all
  end

  it 'shows a list of professors' do
    visit professors_path

    @professors.each do |professor|
      expect(page).to have_css("#prof-#{professor.id}")
    end
  end

  it 'shows the name of each professor' do
    visit professors_path

    @professors.each do |prof|
      within("#prof-#{prof.id}") {expect(page).to have_content(prof.name)}
    end
  end

  it 'shows the age of each professor' do
    visit professors_path

    @professors.each do |prof|
      within("#prof-#{prof.id}") {expect(page).to have_content(prof.age)}
    end
  end

  it 'shows the specialty of each professor' do
    visit professors_path

    @professors.each do |prof|
      within("#prof-#{prof.id}") {expect(page).to have_content(prof.specialty)}
    end
  end
end
