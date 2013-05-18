class AddDoubanImgToBooks < ActiveRecord::Migration
  def change
    add_column :books, :douban_img, :string
    add_column :books, :auto_create, :boolean, :default => false
  end
end
