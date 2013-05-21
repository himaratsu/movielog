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

ActiveRecord::Schema.define(:version => 20130514171538) do

  create_table "actors", :force => true do |t|
    t.integer  "movie_id",   :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "directors", :force => true do |t|
    t.integer  "movie_id",   :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "following_id",                             :null => false
    t.integer  "followed_id",                              :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "delete_flag",  :limit => 1, :default => 0, :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "title",         :null => false
    t.string   "description",   :null => false
    t.integer  "category_id",   :null => false
    t.string   "image_url",     :null => false
    t.integer  "image_num",     :null => false
    t.string   "thumbnail_url", :null => false
    t.datetime "released_at"
    t.integer  "org_id",        :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reports", :force => true do |t|
    t.integer  "user_id",                 :null => false
    t.string   "text"
    t.integer  "type",       :limit => 1, :null => false
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id",                                  :null => false
    t.integer  "movie_id",                                 :null => false
    t.integer  "rate",         :limit => 1, :default => 0, :null => false
    t.string   "comment"
    t.integer  "spoiler_flag", :limit => 1, :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "movie_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_movie_states", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "movie_id",   :null => false
    t.integer  "state_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_movie_states", ["user_id", "movie_id"], :name => "unique_index", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                                        :null => false
    t.string   "nickname",                                    :null => false
    t.string   "email",                                       :null => false
    t.string   "password_digest",                             :null => false
    t.integer  "admin_flag",      :limit => 1, :default => 0, :null => false
    t.string   "icon_url"
    t.integer  "sex",             :limit => 1, :default => 0, :null => false
    t.datetime "birthday"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

end
