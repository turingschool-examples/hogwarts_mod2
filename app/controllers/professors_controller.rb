class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all.order(:name)
  end

  def show
    professor = Professor.find(params[:id])
    @professor_students = professor.students
    @average_age_of_students = professor.average_age_of_students
  end

end
