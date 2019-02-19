class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # record.user == user
    true
  end
end
