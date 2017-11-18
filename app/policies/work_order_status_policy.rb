class WorkOrderStatusPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?   ; user.admin? || user.lab_chief? ; end
  def create?  ; user.admin? || user.lab_chief? ; end
  # def show?    ; true ; end
  def update?  ; user.admin? || user.lab_chief? ; end
  def destroy? ; user.admin? || user.lab_chief? ; end
end
