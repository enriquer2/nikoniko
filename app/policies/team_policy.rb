# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      else user.teamleader?
        scope.where(id: user.team_id)
      end
    end
  end
  def index? # ver equipos si esta registrado y es boss
    user.admin? || user.boss? || user.teamleader?
  end

  def show?
    user.admin? || user.boss? || user.teamleader?
  end

  def create? # crear equipo si esta registrado y es boss
    user.admin? || user.boss?
  end

  def new?
    create?
  end

  def update? # modificar equipo si esta registrado y es boss o si es jefe de equipo
    user.admin? || user.boss? || user.teamleader?
  end

  def edit?
    update?
  end

  def destroy? # destruir equipo si esta registrado y es boss
    user.admin? || user.boss?
  end
end
