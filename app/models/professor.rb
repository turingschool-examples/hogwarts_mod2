class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  validates :name, :age, :specialty, presence: true

  def average_age
    students.average(:age)
  end
end
