class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order(:name)
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def new
  end

  def create
    Professor.create(professor_params)
    redirect_to '/professors'
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end
end
