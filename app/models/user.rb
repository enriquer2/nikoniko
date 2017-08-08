# frozen_string_literal: true

class User < ApplicationRecord
  after_initialize :set_default_value
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  enum user_roles: { admin: 0, boss: 1, teamleader: 2, employee: 3 }

  protected

  def set_default_value
    role = self.role || 3
  end
end
