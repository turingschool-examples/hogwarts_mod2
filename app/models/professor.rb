class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students 

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty

  def students
    student_ids = ProfessorStudent.where(professor_id: self.id).pluck(:student_id)     

    student_ids.flat_map do |id|
      Student.where(id: id)
    end  
  end

  def average_student_age
    ProfessorStudent.joins(:student).where(professor_id: self.id).average(:age).round(1)
  end
end
