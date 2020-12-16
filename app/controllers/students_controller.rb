class StudentsController < ApplicationController
  def index
    @students = Student.order_names
  end
end