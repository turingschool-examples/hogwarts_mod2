class Student < ApplicationRecord
  has_many :professor_students, dependent: :destroy
  has_many :professors, through: :professor_students
  validates_presence_of :name, :age, :house

  def self.average_student_age
    average(:age)
  end

  def self.alpha
    order('name ASC')
  end
end
