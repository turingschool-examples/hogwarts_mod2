class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all.order(:name)
  end
end