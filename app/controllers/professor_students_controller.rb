class ProfessorStudentsController < ApplicationController
  def index
    # @professors = Professor.all
    @professor = Professor.find(params[:id])
    @students = Student.all

  end
end