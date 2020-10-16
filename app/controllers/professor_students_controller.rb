class ProfessorStudentsController < ApplicationController
  def index
    @students = Student.all
  end
end
