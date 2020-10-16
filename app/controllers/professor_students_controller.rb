class ProfessorStudentsController < ApplicationController
  def index
    require "pry"; binding.pry
    student_ids = ProfessorStudent.where("professor_id = #{params[:professor_id]}").pluck(:student_id).to_a
    Student.where("student_id = #{student_ids}").pluck(:name)
  end
end
