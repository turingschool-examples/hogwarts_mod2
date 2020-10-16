class ProfessorStudentsController < ApplicationController
  def index

    student_ids = ProfessorStudent.where("professor_id = #{params[:professor_id]}").pluck(:student_id).to_a
    @students = student_ids.map do |id|
      Student.where("id = #{id}").pluck(:name).first
    end
  end
end
