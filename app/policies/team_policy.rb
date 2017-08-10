# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def index? # ver equipos si esta registrado y es boss
    return true if user_signed_in? && current_user.role == 1
  end

  def create? # crear equipo si esta registrado y es boss
    return true if user_signed_in? && current_user.role == 1
  end

  def update? # modificar equipo si esta registrado y es boss o si es jefe de equipo
    return true if user_signed_in? && (current_user.role == 1 || current_user.role == 2)
  end

  def destroy? # destruir equipo si esta registrado y es boss
    return true if user_signed_in? && current_user.role == 1
  end
end
