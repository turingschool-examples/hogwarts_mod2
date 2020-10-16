class Student <ApplicationRecord
  validates_presence_of :name,
                       :age,
                       :house

  has_many :professor_students
  has_many :professors, through: :professor_students

  def num_of_teachers
    professors.count
  end
end
