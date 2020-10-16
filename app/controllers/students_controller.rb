class StudentsController < ApplicationController
  def index
    @students = Student.order('name ASC').all
  end
end
