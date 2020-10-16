class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
    @professors_alphabetical = @professors.order(:name)
  end

  def show
    @professors = Professor.find(params[:id])  
  end
end