class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  validates_presence_of :name, :age, :specialty

  def student_names
    students.pluck(:name)
  end

  def average_student_age
    students.average(:age)
  end
end
