class ProfessorsController < ApplicationController

  def index
    @professors = Professor.order(:name)
  end

  def show
    @professor = Professor.find(params[:professor_id])
    @students = Professor.find(params[:professor_id]).students.order(:name)
  end

end
