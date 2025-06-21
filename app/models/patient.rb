class Patient < ApplicationRecord
  belongs_to :user
  validates :name, :age, :disease, :registered_at, presence: true
end
