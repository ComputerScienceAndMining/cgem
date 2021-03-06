class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if admin? or lab_chief? or lab_worker?
        scope
      else
        scope.where organisation_id: user.organisation_id
      end
    end
  end

  def permitted_attributes
    if admin? || lab_chief? || lab_worker?
      [:email, :password, :password_confirmation, :first_name, :last_name, :enabled, :role, :organisation_id]
    else
      [:email, :password, :password_confirmation, :first_name, :last_name]
    end
  end

  def index?   ; admin? || lab_chief? || lab_worker? ; end
  def create?  ; admin? || lab_chief? || lab_worker? ; end
  # def show?    ; true ; end
  def update?  ; admin? || lab_chief? || lab_worker? || same_user? ; end
  def destroy? ; (admin? || lab_chief? || lab_worker?) && !same_user? ; end

  def can_change_enabled?
    (admin? || lab_chief? || lab_worker?) && !same_user?
  end

  def can_change_role?
    (admin? || lab_chief? || lab_worker?) && !same_user?
  end

  def can_change_organisation?
    admin? || lab_chief? || lab_worker?
  end

  def same_user? ; record.id == user.id ; end
end
