class FeelingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      else # permisos de teamleader y employee iguales
        scope.where(id: user.team_id)
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
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end
end
