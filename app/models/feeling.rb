class Feeling < ApplicationRecord
  HEAVEN = 5
  SATISFIED = 4
  FRUSTRATED = 3
  UPSET = 2
  PURGATORY = 1
  belongs_to :user

  validates :day, presence: true
  validates :status, presence: true

  enum status: { heaven: HEAVEN, satisfied: SATISFIED, frustrated: FRUSTRATED, upset: UPSET, purgatory: PURGATORY }
end
