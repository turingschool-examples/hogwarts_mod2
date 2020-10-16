class Student <ApplicationRecord
  validates_presence_of :name,
                        :age,
                        :house
  has_many :professor_students
  has_many :professors, through: :professor_students

 def count_of_professors
    professors.count
  end

  def self.sort_by_name
   order(:name)
 end
end
