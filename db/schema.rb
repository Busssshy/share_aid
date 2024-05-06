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

ActiveRecord::Schema.define(version: 2024_05_01_012923) do

  create_table "local_governments", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.integer "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_local_governments_on_email", unique: true
    t.index ["reset_password_token"], name: "index_local_governments_on_reset_password_token", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "local_government_id", null: false
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.boolean "read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["local_government_id"], name: "index_notifications_on_local_government_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
  end

  create_table "reservation_confirmations", force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.integer "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount"
    t.index ["stock_id"], name: "index_reservation_confirmations_on_stock_id"
    t.index ["volunteer_id"], name: "index_reservation_confirmations_on_volunteer_id"
  end

  create_table "reservation_details", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "stock_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_reservation_details_on_reservation_id"
    t.index ["stock_id"], name: "index_reservation_details_on_stock_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stock_id"
    t.integer "amount"
    t.index ["volunteer_id"], name: "index_reservations_on_volunteer_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "local_government_id", null: false
    t.string "name"
    t.date "deadline"
    t.integer "one_daily_quantity"
    t.integer "amount"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["local_government_id"], name: "index_stocks_on_local_government_id"
  end

  create_table "vol_local_gov_relations", force: :cascade do |t|
    t.integer "local_government_id", null: false
    t.integer "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["local_government_id"], name: "index_vol_local_gov_relations_on_local_government_id"
    t.index ["volunteer_id"], name: "index_vol_local_gov_relations_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.string "post_code"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_volunteers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_volunteers_on_reset_password_token", unique: true
  end

  add_foreign_key "notifications", "local_governments"
  add_foreign_key "reservation_confirmations", "stocks"
  add_foreign_key "reservation_confirmations", "volunteers"
  add_foreign_key "reservation_details", "reservations"
  add_foreign_key "reservation_details", "stocks"
  add_foreign_key "reservations", "volunteers"
  add_foreign_key "stocks", "local_governments"
  add_foreign_key "vol_local_gov_relations", "local_governments"
  add_foreign_key "vol_local_gov_relations", "volunteers"
end
