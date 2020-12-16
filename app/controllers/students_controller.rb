class StudentsController < ApplicationController
  def index
    @students = Student.order_by_name
  end
end