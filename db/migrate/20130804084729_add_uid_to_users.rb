class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :description, :string
    add_column :users, :profile_image_url, :string
  end
end
