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

ActiveRecord::Schema.define(version: 2020_08_31_190511) do

  create_table "car_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_party_insurance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "manufacturer"
    t.string "motorization"
    t.string "fuel_type"
    t.integer "car_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_category_id"], name: "index_car_models_on_car_category_id"
  end

  create_table "car_rentals", force: :cascade do |t|
    t.integer "rental_id", null: false
    t.integer "car_id", null: false
    t.integer "user_id", null: false
    t.datetime "start_date"
    t.string "driver_license_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "end_date"
    t.index ["car_id"], name: "index_car_rentals_on_car_id"
    t.index ["rental_id"], name: "index_car_rentals_on_rental_id"
    t.index ["user_id"], name: "index_car_rentals_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "license_plate"
    t.string "color"
    t.integer "car_model_id", null: false
    t.integer "mileage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "client_id"
    t.integer "car_category_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.index ["car_category_id"], name: "index_rentals_on_car_category_id"
    t.index ["client_id"], name: "index_rentals_on_client_id"
    t.index ["token"], name: "index_rentals_on_token", unique: true
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "car_models", "car_categories"
  add_foreign_key "car_rentals", "cars"
  add_foreign_key "car_rentals", "rentals"
  add_foreign_key "car_rentals", "users"
  add_foreign_key "cars", "car_models"
  add_foreign_key "rentals", "car_categories"
  add_foreign_key "rentals", "clients"
  add_foreign_key "rentals", "users"
end
