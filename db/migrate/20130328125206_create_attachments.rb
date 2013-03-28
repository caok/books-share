class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachmenttable_type
      t.integer :attachmenttable_id
      t.string :attachment
    end
  end
end
