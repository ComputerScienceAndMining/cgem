#encoding: utf-8
class TestTypeVersion < ActiveRecord::Base

  # Constants
  # Put here constants for TestTypeVersion

  # Relations
  belongs_to :test_type

  # Callbacks
  # Put here custom callback methods for TestTypeVersion

  # Validations
  # validates :name, <validations>
  # validates :description, <validations>
  # validates :data, <validations>
  # validates :test_type, <validations>

  # Scopes (used for search form)
  # Put here custom queries for TestTypeVersion
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    "#{name} (#{created_at.to_formatted_s(:short)})"
  end

end
