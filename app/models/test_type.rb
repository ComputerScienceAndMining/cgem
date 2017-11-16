#encoding: utf-8
class TestType < ActiveRecord::Base

  # Constants
  # Put here constants for TestType

  # Relations

  # Callbacks
  # Put here custom callback methods for TestType
  after_save :create_new_version

  # Validations
  # validates :name, <validations>
  # validates :description, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for TestType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

  private
    def create_new_version
      TestTypeVersion.create! test_type_id: self.id, name: self.name, data: self.data
    end
end
