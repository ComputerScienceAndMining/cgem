#encoding: utf-8
class LabTest < ActiveRecord::Base

  # Constants
  # Put here constants for LabTest

  # Relations
  belongs_to :work_order
  belongs_to :test_status
  belongs_to :test_type
  belongs_to :test_type_version
  belongs_to :specimen
  belongs_to :tested_by, class_name: 'User', foreign_key: 'tested_by_id'

  # Callbacks
  # Put here custom callback methods for LabTest
  before_save :set_test_type

  # Validations
  # validates :started_at, <validations>
  # validates :ended_at, <validations>
  # validates :work_order, <validations>
  validates :test_status, presence: true
  # validates :test_type, <validations>
  validates :test_type_version, presence: true
  validates :specimen, presence: true
  validates :tested_by, presence: true
  # validates :data, <validations>
  validates :test_type_id, uniqueness: { scope: :specimen_id }

  # Scopes (used for search form)
  # Put here custom queries for LabTest
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  def self.to_xls(work_order)
    # samples = Sample.where(work_order: work_order).includes(:specimens, {lab_tests: :test_type_version})
    specimens = Specimen.where(sample_id: work_order.samples.pluck(:'samples.id')).includes({sample: :sample_type_version}, :specimen_type_version, {lab_tests: [:test_type_version, :tested_by, :test_status]})
    h = specimens.group_by {|s| "#{s.sample.sample_type_version.name}_ #{s.specimen_type_version.name}" }

    h = Hash[h.map {|k, specimens| [k, {
      sample_fields: specimens.first.sample.sample_type_version.data["fields"],
      specimen_fields: specimens.first.specimen_type_version.data["fields"],
      test_type_versions: specimens.map{|s| s.lab_tests}.flatten.map{|lt| lt.test_type_version}.uniq,
      specimens: specimens
    }]}]
  end

  # Instance methods

  # Override to_s method
  def to_s
    self.test_type
  end

  private
  def set_test_type
    if self.test_type_version
      self.test_type = self.test_type_version.test_type
    end
  end
end
