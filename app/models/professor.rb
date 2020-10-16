class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates_presence_of :name, :age, :specialty

  def average_student_age
    (students.pluck(:age).sum / students.count).round(1).to_f
  end



  def self.sort_by_name
    order(:name)
  end

end
