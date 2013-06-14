class AddTransformedToResources < ActiveRecord::Migration
  def change
    add_column :resources, :transformed, :boolean, :default => false
  end
end
