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

ActiveRecord::Schema.define(version: 20141004140822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "uid"
    t.string   "course_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "description"
    t.integer  "par"
    t.integer  "yardage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "holes", force: true do |t|
    t.integer  "course_id"
    t.string   "description"
    t.integer  "hole_number"
    t.integer  "hole_yardage"
    t.integer  "par"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picks", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "player_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tournament_id", null: false
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

  create_table "results", force: true do |t|
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.integer  "position"
    t.integer  "money"
    t.integer  "score"
    t.integer  "strokes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "uid"
    t.string   "event_name"
    t.string   "venue_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "purse"
    t.date     "tournament_start"
    t.date     "tournament_end"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name",                    null: false
    t.string   "email",                        null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
