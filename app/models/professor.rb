class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty

  def avg_student_age
    if self.students.size == 0
      'No students currently'
    else
      self.students.average(:age).round(1)
    end
  end
end
