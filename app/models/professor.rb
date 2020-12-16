class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates_presence_of :name, :age, :specialty

  def average
    self.students.average(:age).round(3)
  end
end
