class Student <ApplicationRecord
  # Validations
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  # Relationships
  has_many :professor_students
  has_many :professors, through: :professor_students
end
