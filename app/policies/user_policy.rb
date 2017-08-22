class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      else
        scope.where(team: user.team)
      end
    end
  end
  def index?
    user.admin? || user.boss? || user.teamleader? || user.employee?
  end

  def show?
    true
  end

  def create?
    user.admin? || user.boss? || user.teamleader?
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.boss? || user.teamleader?
  end
end
