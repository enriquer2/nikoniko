# frozen_string_literal: true

class FeelingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      else #permisos de teamleader y employee iguales
        scope.where(id: user.team_id)
      end
    end
  end
  def index? # ver feeling si es cualquiera
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def show?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def create? # crear feeling si es cualquiera
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def new?
    create?
  end

  def update? # modificar feeling si es cualquiera
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def edit?
    update?
  end

  def destroy? # destruir un feeling si eres cualquiera
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end
end
