class AddUserIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :user_id, :integer
    add_index :books, :user_id
    add_column :resources, :user_id, :integer
    add_index :resources, :user_id
  end
end
