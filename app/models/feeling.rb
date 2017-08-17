class Feeling < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :status, presence: true
end
