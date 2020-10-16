class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty
  has_many :professor_students
  has_many :students, through: :professor_students

  def average_age_of_students
    students.average(:age)
  end
end
