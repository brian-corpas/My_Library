class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def index?
      record.user == user
    end

    def new?
      true
    end

    def show?
      true
    end

    def edit?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end

  end
end
