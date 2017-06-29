class Feeling < ApplicationRecord
  belongs_to :user

  validates :day, date: { after: proc { Time.now - 1.year }, before: proc { Time.now + 1.year } }
  validates :status, presence: true
end
