class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates :name, :age, :specialty, presence: :true

  def student_average_age
    total_student_age = students.sum do |student|
      student.age
    end
    total_student_age / students.count
  end
end
