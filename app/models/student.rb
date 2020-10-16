class Student <ApplicationRecord
  validates_presence_of :name, :house
  has_many :professor_students
  has_many :professors, through: :professor_students
end
