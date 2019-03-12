class Course < ApplicationRecord
  has_many :enrollments,
    foreign_key: :course_id,
    class_name: "Enrollment"

  has_many :enrolled_students,
    through: :enrollments,
    source: :users

  belongs_to :instructor,
    foreign_key: :instructor_id,
    class_name: "User"

  has_many :prereqs, -> { where(prereq_id: !nil) },
    through: :enrollments,
    source: :courses
end
