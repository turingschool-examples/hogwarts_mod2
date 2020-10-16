class ProfessorsController < ApplicationController

  def index
    @professors = Professor.order("name ASC")
  end

  def show
    @professor = Professor.find(params[:id])
  end

end
