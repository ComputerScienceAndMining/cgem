#encoding: utf-8
class Sample < ActiveRecord::Base
  include Dynamisable
  # Constants
  # Put here constants for Sample

  # Relations
  belongs_to :sample_type
  belongs_to :sample_type_version
  belongs_to :work_order
  has_many :specimens, dependent: :restrict_with_error
  has_many :lab_tests, through: :specimens
  has_many :pictures, dependent: :destroy

  # Nested attributes
  accepts_nested_attributes_for :pictures,
    allow_destroy: true,
    reject_if: lambda { |picture| picture[:image].blank? }

  # Callbacks
  before_save :set_sample_type

  # Validations
  validates :code, presence: true
  validates :sample_type_version, presence: true

  # Scopes (used for search form)
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  def self.to_xls options = {}
    all.includes(:sample_type_version, :work_order).group_by { |s| s.sample_type_version.name }
       .map {|st_name, samples| [
           st_name, 
           {
             fields: samples[0].sample_type_version.data["fields"].map {|f| f["name"] }, 
             samples: samples
            }
         ]}.to_h
  end

  # Instance methods

  # Override to_s method
  def to_s
    code  # editable
  end

  private
    def set_sample_type
      if self.sample_type_version
        self.sample_type = self.sample_type_version.sample_type
      end
    end
end
