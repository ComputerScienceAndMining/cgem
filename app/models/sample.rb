#encoding: utf-8
class Sample < ActiveRecord::Base

  # Constants
  # Put here constants for Sample

  # Relations
  belongs_to :sample_type
  belongs_to :sample_type_version
  belongs_to :work_order
  has_many :specimens, dependent: :restrict_with_error
  has_many :lab_tests, through: :specimens
  has_many :pictures

  # Callbacks
  # Put here custom callback methods for Sample
  # after_create :bind_version
  before_save :set_sample_type

  accepts_nested_attributes_for :pictures,
    :allow_destroy => true

  # Validations
  validates :code, presence: true
  # validates :remarks, <validations>
  # validates :sample_type, <validations>
  validates :sample_type_version, presence: true
  # validates :work_order, <validations>
  # validates :data, <validations>

  # Scopes (used for search form)
  # Put here custom queries for Sample
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # def save_with_media params
  #
  #   # extract pictures
  #   new_picture_ids = self.data["fields"].select {|field| field["type"] == "pictures"}
  #                         .map {|f| f["pictures"]}
  #                         .flatten
  #                         .map {|p| p["localId"]}
  #
  #   # delete pictures not included
  #   old_picture_ids = self.pictures.pluck(&:local_id)
  #
  #   deleted_pictures = old_picture_ids - new_picture_ids
  #   new_picture_ids = new_picture_ids - old_picture_ids
  #
  #   new_picture_ids.each do |picture_id|
  #     attached_picture = params["dynamic_files"]["pictures"][picture_id]
  #     new_picture = Picture.new local_id: picture_id, image: attached_picture
  #     new_picture.save
  #     self.pictures.push new_picture
  #   end
  #
  #   self.save
  # end

  def self.to_xls options = {}
    all.group_by { |s| s.sample_type.name }
       .map {|st_name, samples| [
           st_name, 
           {
             fields: samples[0].sample_type.data["fields"].map {|f| f["name"] }, 
             samples: samples
            }
         ]}.to_h
  end

  # Instance methods

  # Override to_s method
  def to_s
    code  # editable
  end

  def bind_version

  end

  def save_pictures

  end

  private
    def set_sample_type
      if self.sample_type_version
        self.sample_type = self.sample_type_version.sample_type
      end
    end
end
