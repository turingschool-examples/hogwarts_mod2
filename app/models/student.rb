class Student <ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students, class_name: 'Professor'

  validates_presence_of :name, :age, :house
end
