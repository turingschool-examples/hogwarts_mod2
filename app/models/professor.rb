class Professor <ApplicationRecord
  validates_presence_of :name,
                        :age,
                        :specialty

  has_many :professor_students
  has_many :students, through: :professor_students

  def avg_student_age
    Student.average(:age).to_f.round(2)
  end
end
