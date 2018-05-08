class Runner < ApplicationRecord
  has_many :preferences
  belongs_to :user

  enum status: [:never_run, :regular, :lapsed]
end
