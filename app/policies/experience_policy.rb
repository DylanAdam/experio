class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    user ? true : false
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
