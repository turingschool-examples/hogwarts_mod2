class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order_by_name
  end

  def show
    @professor = Professor.find(params[:id])
  end
end