# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130602213016) do

  create_table "attachments", :force => true do |t|
    t.string  "attachmenttable_type"
    t.integer "attachmenttable_id"
    t.string  "attachment"
    t.string  "file_name"
    t.string  "file_size"
    t.string  "file_type"
  end

  create_table "books", :force => true do |t|
    t.string   "name"
    t.string   "publishing_house"
    t.integer  "pages"
    t.string   "ISBN"
    t.text     "content"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.string   "douban_img"
    t.boolean  "auto_create",      :default => false
  end

  add_index "books", ["user_id"], :name => "index_books_on_user_id"

  create_table "follows", :force => true do |t|
    t.integer  "followable_id",                      :null => false
    t.string   "followable_type",                    :null => false
    t.integer  "follower_id",                        :null => false
    t.string   "follower_type",                      :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "resources", :force => true do |t|
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "resources", ["book_id"], :name => "index_resources_on_book_id"
  add_index "resources", ["user_id"], :name => "index_resources_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
