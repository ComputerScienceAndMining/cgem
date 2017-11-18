class SpecimenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # def index?   ; true ; end
  def create?  ; admin? || lab_chief? || lab_worker? || org_worker? ; end
  # def show?    ; true ; end
  def update?  ; admin? || lab_chief? || lab_worker? || org_worker? ; end
  def destroy? ; admin? || lab_chief? || lab_worker? || org_worker? ; end
end
