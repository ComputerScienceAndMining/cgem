class WorkOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin? or lab_chief? or lab_worker?
        scope
      else
        scope.where organisation_id: user.organisation_id
      end
    end
  end

  # def index?   ; true ; end
  def create?  ; admin? || lab_chief? ; end
  # def show?    ; true ; end
  def update?  ; admin? || lab_chief? ; end
  def destroy? ; admin? || lab_chief? ; end
end
