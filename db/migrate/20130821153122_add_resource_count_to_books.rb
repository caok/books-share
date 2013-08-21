class AddResourceCountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :resource_count, :int, :default => 0
    add_index :books, :resource_count
  end
end
