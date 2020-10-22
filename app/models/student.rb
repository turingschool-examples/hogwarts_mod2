class Student <ApplicationRecord
  validates_presence_of :name, :age, :house

  has_many :professor_students
  has_many :professors, through: :professor_students

  def professor_count
    # self.professors.count
    professors.count
  end

  def self.by_name
    order(:name)
    # self.order(:name) => self is implied
    #Student.order(:name) => less conventional
  end
end
