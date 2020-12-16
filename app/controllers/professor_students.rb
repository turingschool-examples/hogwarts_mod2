class ProfessorStudentsController < ApplicationController
  def create
    @prof = Application.find(params[:application_id])
    @professor_student = PetApplication.new(student_id: params[:student_id], professor_id: @prof.id)
    # if @professor_student.valid?
    #   @professor_student.save
    # else
    #   flash[:notice] = "You already added that pet!"
    # end
    # redirect_to "/applications/#{@app.id}"
  end
end
