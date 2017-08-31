class FeelingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.boss?
        scope.all
      else # permisos de teamleader y employee iguales
        scope.where(id: user.id)
      end
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
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
    true
  end
end
