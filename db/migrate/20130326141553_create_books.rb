class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :publishing_house
      t.integer :pages
      t.string :ISBN
      t.text :content

      t.timestamps
    end
  end
end
