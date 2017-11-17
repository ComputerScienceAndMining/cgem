#encoding: utf-8
class Parameter < ActiveRecord::Base

  # Constants
  # Put here constants for Parameter

  # Relations

  # Callbacks
  # Put here custom callback methods for Parameter

  # Validations
  validates :key, presence: true
  validates :value, presence: true

  # Scopes (used for search form)
  # Put here custom queries for Parameter
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
