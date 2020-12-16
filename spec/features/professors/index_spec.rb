require "rails_helper"

describe "professors index page" do
  before :each do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    visit "/professors"
  end

  it "has a list of professors with their name, age, and specialty" do
    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@snape.age)
    expect(page).to have_content(@snape.specialty)

    expect(page).to have_content(@hagarid.name)
    expect(page).to have_content(@hagarid.age)
    expect(page).to have_content(@hagarid.specialty)

    expect(page).to have_content(@lupin.name)
    expect(page).to have_content(@lupin.age)
    expect(page).to have_content(@lupin.specialty)
  end

  it "lists records in alphabetical order" do
    pb = page.body
    expect(pb.index(@lupin.name)).to be < (pb.index(@hagarid.name))
    expect(pb.index(@hagarid.name)).to be < (pb.index(@snape.name))
  end
end
