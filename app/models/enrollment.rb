class Enrollment < ApplicationRecord
  belongs_to :cource
  belongs_to :student
  validates :student_id, uniqueness: { scope: :cource_id, message: "Already enroller choose a different option" }
end
