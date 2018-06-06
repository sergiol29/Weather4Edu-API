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

ActiveRecord::Schema.define(version: 20180604112422) do

  create_table "frames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.text "raw", null: false
    t.string "source_ip"
    t.datetime "timestamp", null: false
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "station_id"], name: "index_frames_on_id_and_station_id", unique: true
    t.index ["station_id"], name: "index_frames_on_station_id"
  end

  create_table "last_frames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "timestamp", null: false
    t.float "value", limit: 24, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "station_id"
    t.bigint "variable_id"
    t.index ["station_id", "variable_id"], name: "index_last_frames_on_station_id_and_variable_id", unique: true
    t.index ["station_id"], name: "index_last_frames_on_station_id"
    t.index ["variable_id"], name: "index_last_frames_on_variable_id"
  end

  create_table "stations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.text "name", null: false
    t.string "code", null: false
    t.decimal "latitude", precision: 16, scale: 12
    t.decimal "longitude", precision: 16, scale: 12
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_stations_on_code", unique: true
    t.index ["user_id"], name: "index_stations_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name", null: false
    t.string "email", null: false
    t.string "password_hash", null: false
    t.string "password"
    t.text "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "value_maxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.bigint "variable_id"
    t.float "value", limit: 24, null: false
    t.datetime "timestamp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id", "variable_id"], name: "index_value_maxes_on_station_id_and_variable_id", unique: true
    t.index ["station_id"], name: "index_value_maxes_on_station_id"
    t.index ["variable_id"], name: "index_value_maxes_on_variable_id"
  end

  create_table "value_mins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.bigint "variable_id"
    t.float "value", limit: 24, null: false
    t.datetime "timestamp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id", "variable_id"], name: "index_value_mins_on_station_id_and_variable_id", unique: true
    t.index ["station_id"], name: "index_value_mins_on_station_id"
    t.index ["variable_id"], name: "index_value_mins_on_variable_id"
  end

  create_table "variables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.text "name", null: false
    t.text "symbol", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_variables_on_code", unique: true
  end

  add_foreign_key "frames", "stations"
  add_foreign_key "last_frames", "stations"
  add_foreign_key "last_frames", "variables"
  add_foreign_key "stations", "users"
  add_foreign_key "value_maxes", "stations"
  add_foreign_key "value_maxes", "variables"
  add_foreign_key "value_mins", "stations"
  add_foreign_key "value_mins", "variables"
end
