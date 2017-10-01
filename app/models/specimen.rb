#encoding: utf-8
class Specimen < ActiveRecord::Base

  # Constants
  # Put here constants for Specimen

  # Relations
  belongs_to :sample
  belongs_to :specimen_type
  belongs_to :specimen_type_version
  belongs_to :prepared_by, class_name: 'User', foreign_key: 'prepared_by_id'
  has_many :lab_tests, dependent: :restrict_with_error

  # Callbacks
  # Put here custom callback methods for Specimen

  # Validations
  # validates :code, <validations>
  # validates :remarks, <validations>
  # validates :sample, <validations>
  # validates :specimen_type, <validations>
  # validates :specimen_type_version, <validations>
  # validates :user, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for Specimen
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    code
  end

end
