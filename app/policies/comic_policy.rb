class ComicPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(user: user)
      end
  
      def index?
        record.user == user
      end
  
      def show?
        true
      end
  
      def new?
        true
      end
  
      def create?
        true
      end
  
      def edit?
        true
      end
  
      def update?
        true
      end
  
      def destroy?
        record.user == user
      end
  
    end
  end