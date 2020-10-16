class ProfessorStudentsController < ApplicationController
  def index
    @student_ids = ProfessorStudent.where("professor_id = #{params[:professor_id]}").pluck(:student_id).to_a
  end
end
