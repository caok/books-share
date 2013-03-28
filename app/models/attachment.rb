class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :attachmenttable_id, :attachmenttable_type, :attachmenttable

  mount_uploader :attachment, AttachmentUploader

  belongs_to :attachmenttable, :polymorphic => true

  validates :attachmenttable, :presence => true
  validates :attachment, :presence => true
end
