class Professor <ApplicationRecord
  has_many :students, through: :professor_students
  has_many :professor_students

  validates_presence_of :name, :age, :specialty

  def self.find_students(id)
    joiner = ProfessorStudent.where(professor_id: id)
    joiner.map do |student|
      Student.where(id: student.id)
    end
  end
end

