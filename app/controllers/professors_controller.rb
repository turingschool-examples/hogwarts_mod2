class ProfessorsController < ApplicationController
  def index
    @professors = Professor.order('name ASC').all
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
