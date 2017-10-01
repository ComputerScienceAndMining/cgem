#encoding: utf-8
class WorkOrder < ActiveRecord::Base

  # Constants
  # Put here constants for WorkOrder

  # Relations
  belongs_to :responsible, class_name: 'User', foreign_key: 'responsible_id'
  belongs_to :work_order_status
  belongs_to :organisation
  has_many :samples, dependent: :restrict_with_error
  has_many :specimens, through: :samples
  has_many :lab_tests, through: :specimens

  # Callbacks
  # Put here custom callback methods for WorkOrder

  # Validations
  # validates :name, <validations>
  # validates :description, <validations>
  # validates :due_date, <validations>
  # validates :user, <validations>
  # validates :work_order_status, <validations>
  # validates :organisation, <validations>

  # Scopes (used for search form)
  # Put here custom queries for WorkOrder
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
