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

ActiveRecord::Schema.define(version: 20180627135344) do

  create_table "data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "frame_id"
    t.bigint "station_id"
    t.bigint "variable_id"
    t.float "value", limit: 24
    t.integer "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frame_id", "station_id", "variable_id"], name: "index_data_on_frame_id_and_station_id_and_variable_id", unique: true
    t.index ["frame_id"], name: "index_data_on_frame_id"
    t.index ["station_id"], name: "index_data_on_station_id"
    t.index ["variable_id"], name: "index_data_on_variable_id"
  end

  create_table "frames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.text "raw", null: false
    t.string "source_ip"
    t.integer "timestamp"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "station_id"], name: "index_frames_on_id_and_station_id", unique: true
    t.index ["station_id"], name: "index_frames_on_station_id"
  end

  create_table "last_frames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "timestamp"
    t.float "value", limit: 24
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
    t.text "company"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.text "tokens"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "value_maxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.bigint "variable_id"
    t.float "value", limit: 24, default: -8388610.0
    t.integer "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id", "variable_id"], name: "index_value_maxes_on_station_id_and_variable_id", unique: true
    t.index ["station_id"], name: "index_value_maxes_on_station_id"
    t.index ["variable_id"], name: "index_value_maxes_on_variable_id"
  end

  create_table "value_mins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "station_id"
    t.bigint "variable_id"
    t.float "value", limit: 24, default: 8388610.0
    t.integer "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id", "variable_id"], name: "index_value_mins_on_station_id_and_variable_id", unique: true
    t.index ["station_id"], name: "index_value_mins_on_station_id"
    t.index ["variable_id"], name: "index_value_mins_on_variable_id"
  end

  create_table "variables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.text "name", null: false
    t.string "symbol", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "color", default: "#000000"
    t.index ["code"], name: "index_variables_on_code", unique: true
    t.index ["user_id"], name: "index_variables_on_user_id"
  end

  add_foreign_key "data", "frames"
  add_foreign_key "data", "stations"
  add_foreign_key "data", "variables"
  add_foreign_key "frames", "stations"
  add_foreign_key "last_frames", "stations"
  add_foreign_key "last_frames", "variables"
  add_foreign_key "stations", "users"
  add_foreign_key "value_maxes", "stations"
  add_foreign_key "value_maxes", "variables"
  add_foreign_key "value_mins", "stations"
  add_foreign_key "value_mins", "variables"
  add_foreign_key "variables", "users"
end
