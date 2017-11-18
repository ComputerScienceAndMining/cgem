#encoding: utf-8
class SpecimenTypeVersion < ActiveRecord::Base

  # Constants
  # Put here constants for SpecimenTypeVersion

  # Relations
  belongs_to :specimen_type

  # Callbacks
  # Put here custom callback methods for SpecimenTypeVersion

  # Validations
  # validates :specimen_type, <validations>
  # validates :name, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SpecimenTypeVersion
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    "#{name} (#{created_at.to_formatted_s(:short)})"
  end

end
