#encoding: utf-8
class Organisation < ActiveRecord::Base

  # Constants
  # Put here constants for Organisation

  # Relations
  has_many :work_orders, dependent: :restrict_with_error
  has_many :users
  
  # Callbacks
  # Put here custom callback methods for Organisation

  # Validations
  validates :name, presence: true

  # Scopes (used for search form)
  # Put here custom queries for Organisation
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
