require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe "class methods" do
    it 'can sort records by name' do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    expect(Professor.name_sort).to eq([lupin, hagarid, snape])
    expect(Student.name_sort).to eq([malfoy, harry, longbottom])
    end
  end
end
