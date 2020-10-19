class ProfessorsController < ApplicationController
  def index
    @professors = Professor.by_name
  end

  def show
    @professor = Professor.find(params[:id])
  end
end