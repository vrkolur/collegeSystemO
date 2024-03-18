class Teacher < ApplicationRecord
  has_secure_password
  belongs_to :cource
  validates :name, presence: true
  validates :email, presence: true, format: {with:/[a-z]+@[a-z]/,message:"is Invalid"},uniqueness: true
end
