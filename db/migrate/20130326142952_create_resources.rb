class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :book
      t.string :name
      t.string :format
      t.string :file_size
      t.string :links

      t.timestamps
    end
    add_index :resources, :book_id
  end
end
