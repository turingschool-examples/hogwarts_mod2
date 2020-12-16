class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @students = Professor.find_students(params[:id]).flatten
    @professor = Professor.find(params[:id])
    @age_average = Professor.average_age(@students)
  end
end