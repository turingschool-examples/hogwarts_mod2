class Student <ApplicationRecord
has_many :professor_students
has_many :professors, through: :professor_students

  def no_of_prof
    self.professors.count
  end
end
