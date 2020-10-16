class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    average_age = 0
    @professor.students.count do |student|
      average_age += student.age
    end
    @average_age = (average_age/@professor.students.count)
  end
end
