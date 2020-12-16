class AddProfessorToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :professor, foreign_key: true
  end
end
