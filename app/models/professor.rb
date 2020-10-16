class Professor <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty
end
