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

ActiveRecord::Schema.define(version: 20160415120400) do

  create_table "objects", force: true do |t|
    t.string   "title"
    t.string   "header"
    t.text     "body"
    t.text     "additional_body"
    t.boolean  "is_published"
    t.string   "permalink"
    t.string   "full_path"
    t.string   "image"
    t.integer  "parent_id",        default: 0
    t.integer  "sort_order",       default: 1
    t.integer  "thread_id",        default: 0
    t.integer  "nesting",          default: 0
    t.integer  "object_type_id",   default: 0
    t.integer  "auser_id",         default: 0
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objects", ["header"], name: "index_objects_on_header", using: :btree
  add_index "objects", ["permalink"], name: "index_objects_on_permalink", using: :btree
  add_index "objects", ["title"], name: "index_objects_on_title", using: :btree

end
