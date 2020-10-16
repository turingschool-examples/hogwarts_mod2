class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order(:name)
  end

  def show
    @professor = Professor.find(params[:id])
    @students = @professor.students.order(:name)
  end
end
