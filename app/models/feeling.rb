class Feeling < ApplicationRecord
  PURGATORY = 1
  UPSET = 2
  FRUSTRATED = 3
  SATISFIED = 4
  HEAVEN = 5
  belongs_to :user

  validates :day, presence: true
  validates :status, presence: true

  enum status: { heaven: HEAVEN, satisfied: SATISFIED, frustrated: FRUSTRATED, upset: UPSET, purgatory: PURGATORY }
end
