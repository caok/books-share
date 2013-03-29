class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :attachmenttable_id, :attachmenttable_type, :attachmenttable

  mount_uploader :attachment, AttachmentUploader

  # assocation
  belongs_to :attachmenttable, :polymorphic => true

  # validation
  validates :attachment, :attachmenttable, :presence => true
end
