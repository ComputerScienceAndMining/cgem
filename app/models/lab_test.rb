#encoding: utf-8
class LabTest < ActiveRecord::Base

  # Constants
  # Put here constants for LabTest

  # Relations
  belongs_to :work_order
  belongs_to :test_status
  belongs_to :test_type
  belongs_to :test_type_version
  belongs_to :specimen
  belongs_to :tested_by, class_name: 'User', foreign_key: 'tested_by_id'

  # Callbacks
  # Put here custom callback methods for LabTest

  # Validations
  # validates :name, <validations>
  # validates :description, <validations>
  # validates :started_at, <validations>
  # validates :ended_at, <validations>
  # validates :work_order, <validations>
  # validates :test_status, <validations>
  # validates :test_type, <validations>
  # validates :test_type_version, <validations>
  # validates :specimen, <validations>
  # validates :user, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for LabTest
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    test_type
  end

end
