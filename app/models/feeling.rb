# frozen_string_literal: true

class Feeling < ApplicationRecord
  belongs_to :user

  # validates :day
  validates :status, presence: true
end
