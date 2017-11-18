class TestStatusPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?   ; admin? || lab_chief? ; end
  def create?  ; admin? || lab_chief? ; end
  # def show?    ; true ; end
  def update?  ; admin? || lab_chief? ; end
  def destroy? ; admin? || lab_chief? ; end
end
