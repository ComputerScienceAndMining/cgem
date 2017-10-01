#encoding: utf-8
class SpecimenGroup < ActiveRecord::Base

  # Constants
  # Put here constants for SpecimenGroup

  # Relations
  belongs_to :work_order

  # Callbacks
  # Put here custom callback methods for SpecimenGroup

  # Validations
  # validates :work_order, <validations>
  # validates :name, <validations>
  # validates :description, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SpecimenGroup
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
