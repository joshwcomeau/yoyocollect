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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140607214115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "images", force: true do |t|
    t.string   "url"
    t.integer  "yoyo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers_yoyos", id: false, force: true do |t|
    t.integer "manufacturer_id"
    t.integer "yoyo_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "yoyos", force: true do |t|
    t.string   "model"
    t.decimal  "diameter"
    t.decimal  "width"
    t.decimal  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
