class Student <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  has_many :professor_students
  has_many :professors, through: :professor_students

  def count_of_professors
    professor_students.count {|ps| ps.student_id == id}
  end
end
