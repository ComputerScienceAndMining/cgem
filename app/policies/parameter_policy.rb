class ParameterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?   ; admin? ; end
  def create?  ; admin? ; end
  def show?    ; admin? ; end
  def update?  ; admin? ; end
  def destroy? ; admin? ; end
end
