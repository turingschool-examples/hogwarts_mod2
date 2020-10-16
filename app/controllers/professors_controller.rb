class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all.order(:name)
  end

  def show
    @professor = Professor.find(params[:id])
    students = Student.all
    @average_student_age = ((students.sum { |student|student.age}).to_f / students.count).round(1)
  end
end
