#encoding: utf-8
class SpecimenType < ActiveRecord::Base

  # Constants
  # Put here constants for SpecimenType

  # Relations

  # Callbacks
  # Put here custom callback methods for SpecimenType

  # Validations
  # validates :name, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SpecimenType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
