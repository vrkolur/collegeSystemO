class Cource < ApplicationRecord
    has_one :teacher
    has_many :enrollments
    has_many :students, through: :enrollments
    validates :name, presence: true, uniqueness: true 
    validates :length, presence: true,numericality: { greater_than_or_equal_to: 9, less_than: 18 }
end
