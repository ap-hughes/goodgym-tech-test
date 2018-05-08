class Area < ApplicationRecord
  has_one :user
  validates :location, uniqueness: true
end
