# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :user
  has_many :user
  validates :name, presence: true, uniqueness: true
end
