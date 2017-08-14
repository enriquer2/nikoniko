class Feeling < ApplicationRecord
  belongs_to :user

  validates :date
  validates :status, presence: true
end
