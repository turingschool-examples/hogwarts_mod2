class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    Student.create(student_params)
    redirect_to '/students'
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to "/students/#{student.id}"
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to '/students'
  end

  private
  def student_params
    params.permit(:name, :age, :house)
  end
end
