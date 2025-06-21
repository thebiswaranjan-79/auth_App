class User < ApplicationRecord
  has_secure_password

 enum :role, {
  receptionist: 'receptionist',
  doctor: 'doctor'
}, validate: true


  # Optional: add validations for better UX
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  has_many :patients 
end
