class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students

  validates_presence_of :name, :age, :specialty

  def student_names
    students.map {|student| student.name}
  end
end
