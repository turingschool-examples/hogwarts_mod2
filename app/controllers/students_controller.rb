class StudentsController < ApplicationController
  def index
    @students = Student.all
    @students_alphabetical = @students.order(:name)
  end
end