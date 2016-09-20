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

ActiveRecord::Schema.define(version: 20160920195810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_layers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hydration_packs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "brand"
    t.string   "model"
    t.string   "sex"
    t.integer  "avg_rating"
    t.string   "image_path", default: "/assets/image_not_found.jpg"
    t.string   "type"
  end

  create_table "outerwears", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "distance"
    t.string   "temp_high"
    t.string   "temp_low"
    t.string   "trail_attr"
    t.string   "climate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "race_id"
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "comments"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "rating"
    t.boolean  "approved",             default: false
    t.boolean  "reviewed",             default: false
    t.string   "admin_comments"
    t.integer  "strava_user_total_id"
    t.index ["item_id"], name: "index_reviews_on_item_id", using: :btree
    t.index ["race_id"], name: "index_reviews_on_race_id", using: :btree
    t.index ["strava_user_total_id"], name: "index_reviews_on_strava_user_total_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "shoes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strava_user_totals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "avg_weekly_distance"
    t.float    "avg_weekly_time"
    t.integer  "avg_weekly_elevation_gain"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "avg_speed"
    t.index ["user_id"], name: "index_strava_user_totals_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "strava_id"
    t.string   "email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "token"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "admin",      default: false
  end

  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "races"
  add_foreign_key "reviews", "users"
  add_foreign_key "strava_user_totals", "users"
end
