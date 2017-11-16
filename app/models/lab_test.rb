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

  # Validations
  # validates :name, <validations>
  # validates :description, <validations>
  # validates :started_at, <validations>
  # validates :ended_at, <validations>
  # validates :work_order, <validations>
  # validates :test_status, <validations>
  # validates :test_type, <validations>
  # validates :test_type_version, <validations>
  # validates :specimen, <validations>
  # validates :user, <validations>
  # validates :data, <validations>
  validates :test_type_id, uniqueness: { scope: :specimen_id }

  # Scopes (used for search form)
  # Put here custom queries for LabTest
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  def self.to_xls(work_order)
    samples = Sample.where(work_order: work_order).includes(:specimens, {lab_tests: :test_type})
    specimens = Specimen.where(sample_id: work_order.samples.pluck(:'samples.id')).includes({sample: :sample_type}, :specimen_type, {lab_tests: :test_type})
    h = specimens.group_by {|s| "#{s.sample.sample_type} - #{s.specimen_type}" }

    h = Hash[h.map {|k, specimens| [k, {
      sample_fields: specimens.first.sample.sample_type.data["fields"],
      specimen_fields: specimens.first.specimen_type.data["fields"],
      test_types: specimens.map{|s| s.lab_tests}.flatten.map{|lt| lt.test_type}.uniq,
      specimens: specimens
    }]}]
  end

  # Instance methods

  # Override to_s method
  def to_s
    test_type
  end

end
