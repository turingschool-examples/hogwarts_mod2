class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates :name, presence: true
  validates :age, presence: true
  validates :specialty, presence: true

  def average_student_age
    students.average(:age)
  end
end
