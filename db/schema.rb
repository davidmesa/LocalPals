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

ActiveRecord::Schema.define(version: 20140428003240) do

  create_table "activities", force: true do |t|
    t.string   "address"
    t.text     "description"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img"
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "recommendations"
  end

  create_table "activities_city_trips", force: true do |t|
    t.integer "activity_id"
    t.integer "city_trip_id"
  end

  create_table "activities_interests", force: true do |t|
    t.integer "activity_id"
    t.integer "interest_id"
  end

  create_table "cities", force: true do |t|
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_trips", force: true do |t|
    t.date     "ending_date"
    t.date     "starting_date"
    t.integer  "traveler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "city_trips", ["city_id"], name: "index_city_trips_on_city_id"

  create_table "interests", force: true do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests_users", force: true do |t|
    t.integer "interest_id"
    t.integer "user_id"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages_users", id: false, force: true do |t|
    t.integer "language_id"
    t.integer "user_id"
  end

  create_table "locals", force: true do |t|
    t.text     "about_me"
    t.text     "hobbies"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "university"
    t.string   "img"
  end

  create_table "reviews", force: true do |t|
    t.text     "comment"
    t.date     "date"
    t.integer  "rank"
    t.integer  "local_id"
    t.integer  "traveler_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travelers", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.date     "birthday"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.string   "name"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"

end
