# frozen_string_literal: true

class User < ApplicationRecord
  ADMIN = 0
  BOSS = 1
  TEAMLEADER = 2
  EMPLOYEE = 3
  belongs_to :team
  has_many :feelings, dependent: :destroy
  after_initialize :set_default_value
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  enum role: { admin: ADMIN, boss: BOSS, teamleader: TEAMLEADER, employee: EMPLOYEE }

  protected

  def set_default_value
    role || employee
  end
end
