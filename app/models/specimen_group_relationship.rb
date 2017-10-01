#encoding: utf-8
class SpecimenGroupRelationship < ActiveRecord::Base

  # Constants
  # Put here constants for SpecimenGroupRelationship

  # Relations
  belongs_to :specimen
  belongs_to :specimen_group

  # Callbacks
  # Put here custom callback methods for SpecimenGroupRelationship

  # Validations
  # validates :specimen, <validations>
  # validates :specimen_group, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SpecimenGroupRelationship
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
