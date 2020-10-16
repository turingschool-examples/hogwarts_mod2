# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following information:
# -Name
# -Age
# -Specialty

describe "As a visitor" do
  describe "when I visit '/professors'" do
    it "I see a list of professors with name, age, and specialty" do
      visit "/professors"

      prof_1 = Professor.create({
        name: "Minerva McGonagall",
        age: 204,
        specialty: "Transfiguration"
        })

      prof_2 = Professor.create({
        name: "Severus Snape",
        age: 38,
        specialty: "Dark Arts"
        })

      prof_3 = Professor.create({
        name: "Sybill Trelawney",
        age: 36,
        specialty: "Seer"
        })

      expect(page).to have_content("#{prof_1.name}")
      expect(page).to have_content("Age: #{prof_1.age}")
      expect(page).to have_content("Specialty: #{prof_1.specialty}")
      expect(page).to have_content("#{prof_2.name}")
      expect(page).to have_content("Age: #{prof_2.age}")
      expect(page).to have_content("Specialty: #{prof_2.specialty}")
      expect(page).to have_content("#{prof_3.name}")
      expect(page).to have_content("Age: #{prof_3.age}")
      expect(page).to have_content("Specialty: #{prof_3.specialty}")
    end
  end
end