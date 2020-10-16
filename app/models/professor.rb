class Professor <ApplicationRecord
has_many :professor_students
has_many :students, through: :professor_students

validates_presence_of :name, :age, :specialty

  def average_student_age
    no_of_stu = self.students.count
    age_sum = self.students.sum(:age)
    age_sum.to_f / no_of_stu.to_f
  end
end
