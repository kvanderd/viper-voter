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

ActiveRecord::Schema.define(version: 20140530174130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "categorizations", force: true do |t|
    t.integer "change_id"
    t.integer "category_id"
  end

  create_table "changes", force: true do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "description"
    t.string   "picture"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "change_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "comments", ["ancestry"], name: "index_comments_on_ancestry", using: :btree

  create_table "contacts", force: true do |t|
    t.string  "twiter"
    t.string  "facebook"
    t.string  "form"
    t.string  "phone"
    t.string  "youtub_id"
    t.string  "website"
    t.integer "senate_id"
  end

  create_table "houses", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "middle_name"
    t.string  "gender"
    t.integer "state_id"
    t.integer "party_id"
    t.integer "contact_id"
    t.integer "term_id"
  end

  create_table "office_terms", force: true do |t|
    t.boolean "in_office"
    t.date    "term_start"
    t.date    "term_end"
  end

  create_table "parties", force: true do |t|
    t.string "name"
  end

  create_table "search_suggestions", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senates", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "state_id"
    t.integer "office_term_id"
    t.integer "party_id"
  end

  create_table "states", force: true do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "value"
    t.integer  "change_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
