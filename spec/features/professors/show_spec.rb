#User Story 2 of 4

describe "As a visitor," do
  before(:each) do
    @professor = Professor.create!({name: "Minerva McGonagall",
                                    age: 204,
                                    specialty: "Transfiguration"
                                    })
    @professor.students.create!({name: "Neville Longbottom",
                                 age: 13,
                                 house: "Griffen"
                                 })
    @professor.students.create!({name: "Hermione Granger",
                                 age: 12,
                                 house: "Griffen"
                                 })
    @professor.students.create!({name: "Luna Lovegood",
                                 age: 13,
                                 house: "Griffen"
                                 })
  end
  describe "When I visit '/professors/:id'" do
    it "I see a list of the names of the students the professors have." do
      visit "/professors/#{@professor.id}"
      expect(page).to have_content("Neville Longbottom")
      expect(page).to have_content("Hermione Granger")
      expect(page).to have_content("Luna Lovegood")
    end
  end
end
