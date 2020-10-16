class StudentsController < ApplicationController

  def index
    @students = Student.name_sort
  end
end
