class TestTypeVersionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # def index?   ; true ; end
  def create?  ; false ; end
  # def show?    ; true ; end
  def update?  ; false ; end
  def destroy? ; false ; end
end
