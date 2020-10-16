class ProfessorStudentsController < ApplicationController
  def index
    @students = Student.all.order(:name)
  end
end
