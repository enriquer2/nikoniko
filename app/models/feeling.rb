class Feeling < ApplicationRecord
  belongs_to :user

  validates :day, date: { after: Proc.new { Time.now - 1.year }, before: Proc.new { Time.now + 1.year } }
  validates :status, presence: true
end
