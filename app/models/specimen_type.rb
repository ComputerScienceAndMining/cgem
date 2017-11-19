#encoding: utf-8
class SpecimenType < ActiveRecord::Base

  # Constants
  # Put here constants for SpecimenType

  # Relations
  has_many :specimens, dependent: :restrict_with_error
  has_many :specimen_type_versions, dependent: :restrict_with_error

  # Callbacks
  # Put here custom callback methods for SpecimenType
  after_save :create_new_version

  # Validations
  validates :name, presence: true
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SpecimenType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Class methods
  def self.versions_for work_order
    work_order = WorkOrder.find(work_order)

    # All current versions for work_order
    existing_versions = work_order.specimen_type_versions.uniq
    specimen_type_ids = existing_versions.map{|v| v.specimen_type_id}

    # Selects last version for all other specimen_types
    all_specimen_type_versions = SpecimenTypeVersion.order(specimen_type_id: :asc, created_at: :desc)
                                                    .select('distinct on (specimen_type_id) *')
    # Filter where not in existing_versions
    if specimen_type_ids.any?
      all_specimen_type_versions = all_specimen_type_versions.where('specimen_type_id NOT IN (?)', specimen_type_ids)
    end

    return existing_versions | all_specimen_type_versions
  end

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

  private
    def create_new_version
      SpecimenTypeVersion.create! specimen_type_id: self.id, name: self.name, data: self.data
    end
end
