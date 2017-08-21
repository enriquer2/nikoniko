class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      elsif user.teamleader?
        scope.where(id: user.team_id)
      end
    end
  end
  def index?
    user.admin? || user.boss? || user.teamleader?
  end

  def show?
    user.admin? || user.boss? || user.teamleader?
  end

  def create?
    user.admin? || user.boss?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.boss? || user.teamleader?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.boss?
  end
end
