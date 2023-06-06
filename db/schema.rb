# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_05_153734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carbon_credit_prices", force: :cascade do |t|
    t.string "biome_name"
    t.float "year_1"
    t.float "year_2"
    t.float "year_3"
    t.float "year_4"
    t.float "year_5"
    t.float "year_6"
    t.float "year_7"
    t.float "year_8"
    t.float "year_9"
    t.float "year_10"
    t.float "year_11"
    t.float "year_12"
    t.float "year_13"
    t.float "year_14"
    t.float "year_15"
    t.float "year_16"
    t.float "year_17"
    t.float "year_18"
    t.float "year_19"
    t.float "year_20"
    t.float "year_21"
    t.float "year_22"
    t.float "year_23"
    t.float "year_24"
    t.float "year_25"
    t.float "year_26"
    t.float "year_27"
    t.float "year_28"
    t.float "year_29"
    t.float "year_30"
    t.bigint "earning_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earning_id"], name: "index_carbon_credit_prices_on_earning_id"
  end

  create_table "credit_per_has", force: :cascade do |t|
    t.string "bione_name"
    t.float "year_1"
    t.float "year_2"
    t.float "year_3"
    t.float "year_4"
    t.float "year_5"
    t.float "year_6"
    t.float "year_7"
    t.float "year_8"
    t.float "year_9"
    t.float "year_10"
    t.float "year_11"
    t.float "year_12"
    t.float "year_13"
    t.float "year_14"
    t.float "year_15"
    t.float "year_16"
    t.float "year_17"
    t.float "year_18"
    t.float "year_19"
    t.float "year_20"
    t.float "year_21"
    t.float "year_22"
    t.float "year_23"
    t.float "year_24"
    t.float "year_25"
    t.float "year_26"
    t.float "year_27"
    t.float "year_28"
    t.float "year_29"
    t.float "year_30"
    t.bigint "earning_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earning_id"], name: "index_credit_per_has_on_earning_id"
  end

  create_table "earnings", force: :cascade do |t|
    t.float "year_1"
    t.float "year_2"
    t.float "year_3"
    t.float "year_4"
    t.float "year_5"
    t.float "year_6"
    t.float "year_7"
    t.float "year_8"
    t.float "year_9"
    t.float "year_10"
    t.float "year_11"
    t.float "year_12"
    t.float "year_13"
    t.float "year_14"
    t.float "year_15"
    t.float "year_16"
    t.float "year_17"
    t.float "year_18"
    t.float "year_19"
    t.float "year_20"
    t.float "year_21"
    t.float "year_22"
    t.float "year_23"
    t.float "year_24"
    t.float "year_25"
    t.float "year_26"
    t.float "year_27"
    t.float "year_28"
    t.float "year_29"
    t.float "year_30"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lands", force: :cascade do |t|
    t.string "registration_number"
    t.float "total_area"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "biome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "land_id", null: false
    t.boolean "active"
    t.bigint "earning_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earning_id"], name: "index_offers_on_earning_id"
    t.index ["land_id"], name: "index_offers_on_land_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "tax_number"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carbon_credit_prices", "earnings"
  add_foreign_key "credit_per_has", "earnings"
  add_foreign_key "offers", "earnings"
  add_foreign_key "offers", "lands"
  add_foreign_key "offers", "users"
end
