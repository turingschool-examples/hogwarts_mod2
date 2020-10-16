FactoryBot.define do
  factory :professor do
    name { "Minerva McGonagall" }
    age { 204 }
    specialty { "Transfiguration" }
  end

  factory :student do
    name { "Harry Potter" }
    age { 12 }
    house { "Gryffindor" }
  end

  factory :professor_student do
    professor
    student
  end
end
