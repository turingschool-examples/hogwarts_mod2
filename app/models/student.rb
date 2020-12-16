class Student <ApplicationRecord
  has_many :professors, through: :professor_students
  has_many :professor_students

  validates_presence_of :name, :age, :house

  def self.number_of_professors
    hold = Student.all
    hold.map do |student|
      joiner = ProfessorStudent.where(professor_id: student.id)
      [student, joiner.count]
    end
  end
end
