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

ActiveRecord::Schema.define(version: 20150731210053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champs", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "riot_id"
    t.string   "name"
    t.string   "img_url"
    t.integer  "appearance_count", default: 0
    t.integer  "marry_count",      default: 0
    t.integer  "sleep_count",      default: 0
    t.integer  "kill_count",       default: 0
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "current_month"
  end

  create_table "matchmakers", force: :cascade do |t|
    t.integer  "champ_id"
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matchmakers", ["champ_id"], name: "index_matchmakers_on_champ_id", using: :btree
  add_index "matchmakers", ["round_id"], name: "index_matchmakers_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "games_counter"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
