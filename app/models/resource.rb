class Resource < ActiveRecord::Base
  attr_accessible :file_size, :format, :links, :name, :book_id
  mount_uploader :links, AttachmentUploader

  # assocation
  belongs_to :user
  belongs_to :book

  # validation
  validates :book_id, :presence => true

  ######################
  # callback functions #
  ######################
  before_save :set_resource_attributes
  def set_resource_attributes
    if links.present? && links_changed?
      self.name      = File.basename(links.file.identifier, '.*').titleize
      self.format    = links.file.content_type.split('/').last
      self.file_size = links.file.size
    end
  end
  protected :set_resource_attributes
end
