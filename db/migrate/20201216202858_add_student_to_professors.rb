class AddStudentToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_reference :professors, :student, foreign_key: true
  end
end
