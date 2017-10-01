#encoding: utf-8
class SampleTypeVersion < ActiveRecord::Base

  # Constants
  # Put here constants for SampleTypeVersion

  # Relations
  belongs_to :sample_type

  # Callbacks
  # Put here custom callback methods for SampleTypeVersion

  # Validations
  # validates :sample_type, <validations>
  # validates :name, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SampleTypeVersion
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
