class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end
end
