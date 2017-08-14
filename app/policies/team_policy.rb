# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def index? # ver equipos si esta registrado y es boss
    user.admin? || user.boss?
  end

  def create? # crear equipo si esta registrado y es boss
    user.admin? || user.boss?
  end

  def update? # modificar equipo si esta registrado y es boss o si es jefe de equipo
    user.admin? || user.boss? || user.teamleader?
  end

  def destroy? # destruir equipo si esta registrado y es boss
    user.admin? || user.boss?
  end
end
