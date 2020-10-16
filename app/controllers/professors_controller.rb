class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
    @students = @professor.students
    age = 0
    @students.each do |student|
      age += student.age
    end
    @average_age = (age / (@students.count))
  end
end
