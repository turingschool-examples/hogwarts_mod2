class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :professor_students
  has_many :professors, through: :professor_students

  def professor_count
    professors.count
  end

  def self.avg_age
    average(:age)
  end

  def self.alphabetical
    order(:name)
  end
end
