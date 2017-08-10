# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
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
  end
end
