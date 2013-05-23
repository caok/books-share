# == Schema Information
#
# Table name: attachments
#
#  id                   :integer          not null, primary key
#  attachmenttable_type :string(255)
#  attachmenttable_id   :integer
#  attachment           :string(255)
#  file_name            :string(255)
#  file_size            :string(255)
#  file_type            :string(255)
#

class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :attachmenttable_id, :attachmenttable_type, :attachmenttable

  mount_uploader :attachment, AttachmentUploader

  # assocation
  belongs_to :attachmenttable, :polymorphic => true

  # validation
  validates :attachment, :attachmenttable, :presence => true

  ######################
  # callback functions #
  ######################
  before_save :set_attachment_attributes
  def set_attachment_attributes
    if attachment.present? && attachment_changed?
      self.file_name = File.basename(attachment.file.identifier, '.*').titleize
      self.file_type = attachment.file.content_type
      self.file_size = attachment.file.size
    end
  end
  protected :set_attachment_attributes
end
