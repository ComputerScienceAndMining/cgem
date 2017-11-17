#encoding: utf-8
class WorkOrderStatus < ActiveRecord::Base

  # Constants
  # Put here constants for WorkOrderStatus

  # Relations

  # Callbacks
  # Put here custom callback methods for WorkOrderStatus

  # Validations
  validates :name, presence: true

  # Scopes (used for search form)
  # Put here custom queries for WorkOrderStatus
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
