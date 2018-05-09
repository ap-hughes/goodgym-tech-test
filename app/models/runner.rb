class Runner < ApplicationRecord
  has_one :preference
  belongs_to :user

  enum status: [:regular, :lapsed, :never_run]
end
