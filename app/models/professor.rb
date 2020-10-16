class Professor <ApplicationRecord
  # Validations
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty

  # Relationships
  has_many :professor_students
end
