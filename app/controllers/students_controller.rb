class StudentsController < ApplicationController

  def index
    @students = Student.number_of_professors
  end
end