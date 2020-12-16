class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates :name, :age, :specialty, presence: true

  def full_info
    "Name: #{name}, Age: #{age}, Specialty: #{specialty}"
  end

  def students_avg_age
    #Professor.select('professors.id, students.age').joins(:students).where('professors.id = 1').average(students.age).to_i
    students.sum do |student|
      student.age
    end / students.count
  end
end
