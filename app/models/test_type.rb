#encoding: utf-8
class TestType < ActiveRecord::Base

  # Constants
  # Put here constants for TestType

  # Relations
  has_many :lab_tests, dependent: :restrict_with_error
  has_many :test_type_versions, dependent: :restrict_with_error

  # Callbacks
  # Put here custom callback methods for TestType
  after_save :create_new_version

  # Validations
  validates :name, presence: true
  # validates :description, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for TestType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Class methods
  def self.versions_for work_order
    work_order = WorkOrder.find(work_order)

    # All current versions for work_order
    existing_versions = work_order.test_type_versions.uniq
    test_type_ids = existing_versions.map{|v| v.test_type_id}

    # Selects last version for all other test_types
    all_test_type_versions = TestTypeVersion.order(test_type_id: :asc, created_at: :desc)
                                                    .select('distinct on (test_type_id) *')
    # Filter where not in existing_versions
    if test_type_ids.any?
      all_test_type_versions = all_test_type_versions.where('test_type_id NOT IN (?)', test_type_ids)
    end

    return existing_versions | all_test_type_versions
  end

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

  private
    def create_new_version
      TestTypeVersion.create! test_type_id: self.id, name: self.name, description: self.description, data: self.data
    end
end
