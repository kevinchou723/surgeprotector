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

ActiveRecord::Schema.define(version: 20140903021450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "averages", force: true do |t|
    t.string   "day_of_week"
    t.integer  "hour_created"
    t.float    "surge_multiplier"
    t.integer  "price_query_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "price_queries", force: true do |t|
    t.float    "start_latitude"
    t.float    "start_longitude"
    t.float    "end_latitude"
    t.float    "end_longitude"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.integer  "user_id"
    t.string   "start_address"
  end

  create_table "price_results", force: true do |t|
    t.string   "localized_display_name"
    t.string   "low_estimate"
    t.string   "display_name"
    t.string   "product_id"
    t.float    "surge_multiplier"
    t.string   "estimate"
    t.string   "high_estimate"
    t.integer  "price_query_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency_code"
    t.string   "day_of_week"
    t.integer  "hour_created"
    t.datetime "local_time_created"
  end

  create_table "stored_price_results", id: false, force: true do |t|
    t.integer "id",                                 null: false
    t.string  "localized_display_name", limit: nil
    t.string  "low_estimate",           limit: nil
    t.string  "display_name",           limit: nil
    t.string  "product_id",             limit: nil
    t.float   "surge_multiplier"
    t.string  "estimate",               limit: nil
    t.string  "high_estimate",          limit: nil
    t.string  "currency_code",          limit: nil
    t.string  "day_of_week",            limit: nil
    t.integer "hour_created"
    t.integer "price_query_id"
  end

  create_table "user_routes", force: true do |t|
    t.float    "start_latitude"
    t.float    "start_longitude"
    t.float    "end_latitude"
    t.float    "end_longitude"
    t.string   "city"
    t.string   "nickname"
    t.string   "start_address"
    t.string   "end_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
