class Student <ApplicationRecord
  validates_presence_of :name, :house, :age
  has_many :professor_students
  has_many :professors, through: :professor_students

  def professor_count
    professors.count
  end
end
