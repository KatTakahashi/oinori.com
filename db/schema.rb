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

ActiveRecord::Schema.define(version: 2022_04_09_121537) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asks", force: :cascade do |t|
    t.string "body"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.integer "ask_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lols", force: :cascade do |t|
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.decimal "score", precision: 5, scale: 3
  end

  create_table "visiters", force: :cascade do |t|
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
