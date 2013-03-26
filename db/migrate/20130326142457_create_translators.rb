class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :name

      t.timestamps
    end
  end
end
