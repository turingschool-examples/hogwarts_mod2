class Professor <ApplicationRecord
validates_presence_of :name
validates_presence_of :specialty
validates_presence_of :age

has_many :professor_students
has_many :students, through: :professor_students
  
end

