class Student <ApplicationRecord
  has_many :professor_students, dependent: :destroy
  has_many :professors, through: :professor_students
  default_scope -> {order(:name)}
  validates_presence_of :name, :age, :house

  def prof_count
    professors.count
  end

end
