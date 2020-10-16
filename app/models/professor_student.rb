class ProfessorStudent <ApplicationRecord
  belongs_to :student
  belongs_to :professor

  def self.students(professor_id)
    ids = ProfessorStudent.where("professor_id = #{professor_id}").pluck(:student_id).to_a
    ids.map do |student_id|
      Student.where("id = #{student_id}").pluck(:name).first
    end
  end

  def self.average_age(professor_id)
    students = self.students(professor_id)
    Student.average(:age).where()
  end
end
