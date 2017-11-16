#encoding: utf-8
class SampleType < ActiveRecord::Base

  # Constants
  # Put here constants for SampleType

  # Relations
  has_many :samples
  has_many :sample_type_versions

  # Callbacks
  # Put here custom callback methods for SampleType
  after_save :create_new_version

  # Validations
  # validates :name, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for SampleType
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search
  
  # Class methods
  def self.versions_for work_order
    work_order = WorkOrder.find(work_order)

    # All current versions for work_order
    existing_versions = work_order.sample_type_versions.uniq
    sample_type_ids = existing_versions.map{|v| v.sample_type_id}

    # Selects last version for all other sample_types
    all_sample_type_versions = SampleTypeVersion.order(sample_type_id: :asc, created_at: :desc)
                                                .select('distinct on (sample_type_id) *')
    # Filter where not in existing_versions
    if sample_type_ids.any?
      all_sample_type_versions = all_sample_type_versions.where('sample_type_id NOT IN (?)', sample_type_ids)
    end

    return existing_versions | all_sample_type_versions
  end

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

  private
    def create_new_version
      SampleTypeVersion.create! sample_type_id: self.id, name: self.name, data: self.data
    end
end
