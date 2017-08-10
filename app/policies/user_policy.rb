# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      elsif user.teamleader?
        scope.where(role: User.roles[:teamleader])
      else
        scope.where(role: User.roles[:employer])
      end
    end
  end

  def index?
    true
  end

  def create? # este ya no haria falta si hemos puesto que tiene que estar registrado siempre, no?
    user_signed_in?
  end

  def update? # modificar usuario si esta registrado y es boss
    return true if user_signed_in? && (user.admin? || user.boss?)
  end

  def destroy? # destruir usuario si esta registrado y es boss o jefe de equipo
    return true if user_signed_in? && (user.admin? || user.boss? == 1 || user.teamleader? == 2)
  end
end
