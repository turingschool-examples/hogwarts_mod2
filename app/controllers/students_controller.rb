class StudentsController < ApplicationController

  def index
    @students = Student.sort_by_name
  end

end
