class ProfessorsController < ApplicationController
  def index
    @professors = Professor.sorted_by_alphabet
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
