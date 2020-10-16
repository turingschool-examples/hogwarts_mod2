class ProfessorsController < ApplicationController

  def index
    @professors = Professor.order(:name)
  end

  def show
    @students = Professor.find(params[:professor_id]).students.order(:name)
  end

end
