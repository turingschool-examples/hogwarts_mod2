class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty

  has_many :professor_students
  has_many :students, through: :professor_students, class_name: 'Student'

  def students_ave_age
    self.students.average(:age)
  end
  
end
