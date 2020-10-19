class StudentsController < ApplicationController
  def index
    @students = Student.by_name
  end
end