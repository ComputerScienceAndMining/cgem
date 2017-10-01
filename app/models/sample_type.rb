#encoding: utf-8
class SampleType < ActiveRecord::Base

  # Constants
  # Put here constants for SampleType

  # Relations
  has_many :samples
  # Callbacks
  # Put here custom callback methods for SampleType

  # Validations
  # validates :name, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SampleType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
