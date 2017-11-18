#encoding: utf-8
class Specimen < ActiveRecord::Base

  # Constants
  # Put here constants for Specimen

  # Relations
  belongs_to :sample
  belongs_to :specimen_type
  belongs_to :specimen_type_version
  belongs_to :prepared_by, class_name: 'User', foreign_key: 'prepared_by_id'
  has_many :lab_tests, dependent: :restrict_with_error

  # Callbacks
  # Put here custom callback methods for Specimen
  before_save :set_specimen_type
  
  # Validations
  validates :code, presence: true
  # validates :remarks, <validations>
  validates :sample, presence: true
  # validates :specimen_type, <validations>
  validates :specimen_type_version, presence: true
  validates :prepared_by, presence: true
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for Specimen
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  def self.to_xls options = {}
    all.includes(:specimen_type_version, :prepared_by).group_by { |s| s.specimen_type_version.name }
       .map {|st_name, specimens| [
         st_name, 
         {
           fields: specimens[0].specimen_type_version.data["fields"].map {|f| f["name"] }, 
           specimens: specimens
          }
       ]}.to_h
  end

  # Instance methods

  # Override to_s method
  def to_s
    code
  end

  private
    def set_specimen_type
      if self.specimen_type_version
        self.specimen_type = self.specimen_type_version.specimen_type
      end
    end
end
