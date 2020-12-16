class Student <ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students

  validates_presence_of :name, :age, :house

  def self.order_names
    all.order(:name)
  end
end
