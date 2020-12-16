class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
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

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    redirect_to "/professors/#{professor.id}"
  end

  def destroy
    Professor.destroy(params[:id])
    redirect_to '/professors'
  end

  private
  def professor_params
    params.permit(:name, :age, :specialty)
  end
end
