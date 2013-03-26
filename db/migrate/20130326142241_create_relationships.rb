class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :tag
      t.references :book
      t.references :author
      t.references :translator

      t.timestamps
    end
    add_index :relationships, :tag_id
    add_index :relationships, :book_id
    add_index :relationships, :author_id
    add_index :relationships, :translator_id
  end
end
