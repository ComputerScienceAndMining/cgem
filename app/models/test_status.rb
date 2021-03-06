#encoding: utf-8
class TestStatus < ActiveRecord::Base

  # Constants
  # Put here constants for TestStatus

  # Relations
  has_many :lab_tests, dependent: :restrict_with_error
  
  # Callbacks
  # Put here custom callback methods for TestStatus

  # Validations
  validates :name, presence: true

  # Scopes (used for search form)
  # Put here custom queries for TestStatus
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
