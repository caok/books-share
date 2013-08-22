class AddDownloadCountToBook < ActiveRecord::Migration
  def change
    add_column :books, :download_count, :int, :default => 0
    add_index :books, :download_count
  end
end
