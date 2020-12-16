class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @students = Professor.find_students(params[:id]).flatten
    @professor = Professor.find(params[:id])
    # require 'pry'; binding.pry
  end
end