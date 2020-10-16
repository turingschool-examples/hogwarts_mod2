class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty

  has_many :professor_students
  has_many :students, through: :professor_students

  def average_age(students)
    average = 0
    students.each do |student|
      average += student.age
    end
    average/students.count
  end
end
