class Professor <ApplicationRecord
  has_many :professor_students
  has_many :students, through: :professor_students
  validates :name, :age, :specialty, presence: true

  def full_info
    "Name: #{name}, Age: #{age}, Specialty: #{specialty}"
  end
end
