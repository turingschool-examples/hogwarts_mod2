class Professor <ApplicationRecord
    has_many :professor_students
    has_many :students, through: :professor_students

    validates :name, presence: true
    validates :age, presence: true
    validates :specialty, presence: true

    def avg_student_age
        self.students.average(:age)
    end

    def self.sort_by_name
        order(:name)
    end
end
