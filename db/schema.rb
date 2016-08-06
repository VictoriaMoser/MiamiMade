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

ActiveRecord::Schema.define(version: 20160805221759) do

  create_table "investors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "address"
    t.text     "description"
    t.date     "founded_date"
    t.boolean  "approval",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.string   "shortdescription"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "vertical"
    t.index ["user_id"], name: "index_investors_on_user_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "address"
    t.text     "description"
    t.date     "founded_date"
    t.boolean  "approval",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.string   "email"
    t.string   "shortdescription"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "vertical"
    t.index ["user_id"], name: "index_startups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "admin",              default: false
    t.boolean  "email_confirmation"
    t.string   "token_confirmation"
    t.boolean  "approval",           default: false
  end

end
