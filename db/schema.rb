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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_123854) do
  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_lines_on_train_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.decimal "weight"
    t.decimal "volume"
    t.integer "status", default: 0
    t.integer "user_id"
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_parcels_on_train_id"
    t.index ["user_id"], name: "index_parcels_on_user_id"
  end

  create_table "train_lines", force: :cascade do |t|
    t.integer "line_id"
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_train_lines_on_line_id"
    t.index ["train_id"], name: "index_train_lines_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "name"
    t.decimal "cost"
    t.decimal "total_weight"
    t.decimal "total_volume"
    t.integer "status", default: 0
    t.integer "assigned_line"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "remaining_weight_capacity"
    t.decimal "remaining_volume_capacity"
    t.datetime "left_at"
    t.index ["user_id"], name: "index_trains_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lines", "trains"
  add_foreign_key "parcels", "trains"
  add_foreign_key "parcels", "users"
  add_foreign_key "train_lines", "lines"
  add_foreign_key "train_lines", "trains"
  add_foreign_key "trains", "users"
end
