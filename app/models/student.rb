class Student < ApplicationRecord
    has_secure_password
    has_many :enrollments
    has_many :cources, through: :enrollments
    validates :name, presence: true
    validates :email, presence: true, format: {with:/[a-z]+@[a-z]/,message:"is Invalid"},uniqueness: true
    validates :address, presence: true
    validates :father_name, presence: true
end
