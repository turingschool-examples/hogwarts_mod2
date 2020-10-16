class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    professor = Professor.find(params[:id])
    @professor_students = professor.students
  end

end
