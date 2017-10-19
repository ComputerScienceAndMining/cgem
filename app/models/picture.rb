#encoding: utf-8
class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Constants
  # Put here constants for Picture

  # Relations
  belongs_to :sample
  belongs_to :specimen
  belongs_to :lab_test

  # Callbacks
  # Put here custom callback methods for Picture

  # Validations
  # validates :local_id, <validations>
  # validates :sample, <validations>
  # validates :specimen, <validations>
  # validates :lab_test, <validations>

  # Scopes (used for search form)
  # Put here custom queries for Picture
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") } # Scope for search

  # Instance methods

  # Override to_s method
  def to_s
    (defined? name)? name : ((defined? email)? email : id)  # editable
  end

end
