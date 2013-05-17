class AddFileInfoToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :file_name, :string
    add_column :attachments, :file_size, :string
    add_column :attachments, :file_type, :string
  end
end
