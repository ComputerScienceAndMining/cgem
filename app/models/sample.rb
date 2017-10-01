#encoding: utf-8
class Sample < ActiveRecord::Base

  # Constants
  # Put here constants for Sample

  # Relations
  belongs_to :sample_type
  belongs_to :sample_type_version
  belongs_to :work_order
  has_many :specimens, dependent: :restrict_with_error
  has_many :lab_tests, through: :specimens

  # Callbacks
  # Put here custom callback methods for Sample
  after_create :bind_version

  # Validations
  # validates :code, <validations>
  # validates :remarks, <validations>
  # validates :sample_type, <validations>
  # validates :sample_type_version, <validations>
  # validates :work_order, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for Sample
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    code  # editable
  end

  def bind_version
    
  end
end
