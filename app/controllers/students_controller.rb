class StudentsController < ApplicationController

  def index
    @students = Student.order(:name)
  end

  def show
    @student = Student.find(params[:id])
    @professors = @student.professors.order(:name)
  end

end
