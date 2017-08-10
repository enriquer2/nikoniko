# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
<<<<<<< 4293bff1c057dcd143c7962b257dfe26101dfee6
  class Scope
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
=======
  def index?
    true
  end

  def create? # duda
    user_signed_in?
  end

  def update? # modificar usuario si esta registrado y es boss
    return true if user_signed_in? && current_user.role == 1
  end

  def destroy? # destruir usuario si esta registrado y es boss o jefe de equipo
    return true if user_signed_in? && (current_user.role == 1 || current_user.role == 2)
>>>>>>> write first policies
  end
end
