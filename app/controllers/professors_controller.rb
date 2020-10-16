class ProfessorsController < ApplicationController

  def index
    @professors = Professor.name_sort
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
