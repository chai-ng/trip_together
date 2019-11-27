# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_27_085817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.text "place_id"
    t.bigint "trip_id", null: false
    t.string "name"
    t.string "international_phone_number"
    t.string "formatted_address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "website"
    t.string "opening_hours", array: true
    t.string "type"
    t.float "rating"
    t.integer "price_level"
    t.float "cost"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_places_on_trip_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "travellers", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "user_email"
    t.boolean "existing_user"
    t.boolean "accepted_invite"
    t.float "user_budget"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_travellers_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "calendar_name"
    t.string "calendar_time_zone"
    t.bigint "user_id", null: false
    t.text "calendar_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.text "image_url"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "access_token"
    t.datetime "expire_by"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "trip_id", null: false
    t.bigint "user_id", null: false
    t.string "vote_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_votes_on_place_id"
    t.index ["trip_id"], name: "index_votes_on_trip_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "places", "trips"
  add_foreign_key "places", "users"
  add_foreign_key "travellers", "trips"
  add_foreign_key "trips", "users"
  add_foreign_key "votes", "places"
  add_foreign_key "votes", "trips"
  add_foreign_key "votes", "users"
end
