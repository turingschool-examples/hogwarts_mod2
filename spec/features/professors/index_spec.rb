require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/professors'" do
    before :each do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38, specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49, specialty: "Defense Against The Dark Arts")

      @harry = Student.create(name: "Harry Potter", age: 11, house: "Gryffindor")
      @malfoy = Student.create(name: "Draco Malfoy", age: 12, house: "Slytherin")
      @longbottom = Student.create(name: "Neville Longbottom", age: 11, house: "Gryffindor")

      ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
      ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
      ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    end

    it "I see a list of professors with the following information:" do
      visit professors_path

      within("#professor-#{@snape.id}") do
        expect(page).to have_content(@snape.name)
        expect(page).to have_content("Age: #{@snape.age}")
        expect(page).to have_content(@snape.specialty)
      end

      within("#professor-#{@hagarid.id}") do
        expect(page).to have_content(@hagarid.name)
        expect(page).to have_content("Age: #{@hagarid.age}")
        expect(page).to have_content(@hagarid.specialty)
      end

      within("#professor-#{@lupin.id}") do
        expect(page).to have_content(@lupin.name)
        expect(page).to have_content("Age: #{@lupin.age}")
        expect(page).to have_content(@lupin.specialty)
      end
    end

    it 'sorts professors alphabetically' do
      visit professors_path
      expect(current_path).to eq(professors_path)

      expect(all('.professor-name')[0].text).to eq(@lupin.name)
      expect(all('.professor-name')[1].text).to eq(@hagarid.name)
      expect(all('.professor-name')[2].text).to eq(@snape.name)
    end

  end
end
