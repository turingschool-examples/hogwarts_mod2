class Student <ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students
  validates :name, :age, :house, presence: true

  def num_professors
    professors.count
  end
end
