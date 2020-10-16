class Student < ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  def professors
    professor_ids = ProfessorStudent.where(student_id: id).pluck(:professor_id)

    professor_ids.flat_map do |id|
      Professor.where(id: id)
    end
  end
end
