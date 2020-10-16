class StudentsController < ApplicationController

  def index
    @students = Student.order("name ASC")
  end

end
