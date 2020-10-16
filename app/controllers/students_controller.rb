class StudentsController < ApplicationController
  def index
    @students = Student.sorted_by_alphabet
  end
end
