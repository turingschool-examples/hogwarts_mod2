class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    professor(params[:id])
    professor_students(@professor.id)
  end

  private

  def professor(professor_id)
    @professor ||= Professor.find(professor_id)
  end

  def professor_students(professor_id)
    professor(professor_id)
    @students ||= @professor.students
  end
end
