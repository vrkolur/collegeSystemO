class Enrollment < ApplicationRecord
  belongs_to :cource
  belongs_to :student
  validate :student_same_cource

  def student_same_cource
    if Enrollment.exists?(student_id: student_id, cource_id: cource_id)
      errors.add(:base, "You are already enrolled in this course.")
    end
  end
end
