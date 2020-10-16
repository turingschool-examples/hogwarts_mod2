class ProfessorStudent <ApplicationRecord
  has_many :students
  belongs_to :professor
  belongs_to :student
end
