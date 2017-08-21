# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      elsif user.teamleader?
        scope.where(role: User.roles[:teamleader])
      else
        scope.where(role: User.roles[:employee])
      end
    end
  end
  def index?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def show?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def create?
    user.admin? || user.boss? || user.teamleader?
  end

  def new?
    create?
  end

  def update? # modificar usuario si esta registrado y es boss
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def edit?
    update?
  end

  def destroy? # destruir usuario si esta registrado y es boss o jefe de equipo
    user.admin? || user.boss? || user.teamleader?
  end
end
