class StudentsController < ApplicationController
  def index
    @students = Student.order(:name)
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    Student.create(student_params)
    redirect_to '/students'
  end

  private
  def student_params
    params.permit(:name, :age, :house)
  end
end
