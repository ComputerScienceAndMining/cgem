#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Constants
  # Put here constants for User

  # Relations

  # Callbacks
  # Put here custom callback methods for User

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :enabled, presence: true
  validates :role, presence: true

  # Scopes (used for search form)
  # Put here custom queries for User
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    "#{first_name} #{last_name}"
    # (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
