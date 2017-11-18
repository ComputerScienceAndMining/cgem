#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Constants
  ROLES = [
    {id: 0,   name: 'admin'}, # Developers
    {id: 100, name: 'lab_chief'},
    {id: 200, name: 'lab_worker'},
    {id: 300, name: 'org_worker'},
    {id: 400, name: 'org_viewer'},
  ]

  # Relations
  belongs_to :organisation

  # Callbacks
  # Put here custom callback methods for User
  after_initialize :default_role

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :enabled, presence: true
  validates :role, presence: true

  # Scopes (used for search form)
  # Put here custom queries for User
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods
  def admin? ;       role == 0 ; end
  def lab_chief? ;   role == 100 ; end
  def lab_worker? ;  role == 200 ; end
  def org_worker? ;  role == 300 ; end
  def org_viewer? ;  role == 400 ; end

  # Override to_s method
  def to_s
    "#{first_name} #{last_name}"
    # (defined? name)? name : ((defined? email)? email : id)  # editable
  end

  # Overriding devise method for active users
  def active_for_authentication?  ; super && self.enabled? ; end

  # Overriding devise inactive message
  # def inactive_message    ; "Sorry, this account has been deactivated." ; end

  def role_name
    User::ROLES.find{ |rol| rol[:id] == self.role }[:name] if User::ROLES.any? { |rol| rol[:id] == self.role }
  end

  private
    # Callback methods
    # Set default role value => Organisation Viewer
    def default_role ; self.role ||= 500 ; end
end
