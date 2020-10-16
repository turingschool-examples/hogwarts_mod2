class Professor <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty

  has_many :professor_students
  has_many :students, {through: :professor_students, source: :student}

  def average_student_age
    count_of_students = ProfessorStudent.where("professor_id == #{id}")
    students_to_find = ProfessorStudent.select(:student_id).where("professor_id == #{id}")
  end
end
