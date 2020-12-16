class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order_names
  end

  def show
    @professor = Professor.find(params[:id])
  end
end