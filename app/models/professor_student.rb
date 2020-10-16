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
    ids = ProfessorStudent.where("professor_id = #{professor_id}").pluck(:student_id).to_a
    sum = ids.sum do |id|
      Student.where("id = #{id}").pluck(:age).first
    end
    (sum.to_f / ids.count).round(1)
  end
end
