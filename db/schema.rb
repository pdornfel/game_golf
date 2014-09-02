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

ActiveRecord::Schema.define(version: 20140902143155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "picks", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "height"
    t.integer  "weight"
    t.date     "birthday"
    t.string   "country"
    t.string   "birth_place"
    t.string   "turned_pro"
    t.date     "sports_data_updated_on"
    t.integer  "events_played"
    t.integer  "first_place"
    t.integer  "second_place"
    t.integer  "third_place"
    t.integer  "top_10"
    t.integer  "top_25"
    t.integer  "withdrawals"
    t.integer  "earnings"
    t.integer  "earnings_rank"
    t.integer  "drive_avg"
    t.integer  "drive_acc"
    t.integer  "gir_pct"
    t.integer  "world_rank"
    t.integer  "scoring_avg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
