class RemoveFileInfoFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :name
    remove_column :resources, :file_size
    remove_column :resources, :format
    remove_column :resources, :links
  end
end
