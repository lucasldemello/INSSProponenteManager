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

ActiveRecord::Schema[7.0].define(version: 2024_03_25_190804) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "proponent_id", null: false
    t.string "street", null: false
    t.string "building_number"
    t.string "district", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_addresses_on_proponent_id"
  end

  create_table "proponent_phones", force: :cascade do |t|
    t.bigint "proponent_id", null: false
    t.integer "phone_type", default: 0
    t.string "phone_number", null: false
    t.string "info", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_proponent_phones_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "birthdate", null: false
    t.decimal "salary", precision: 10, scale: 2, null: false
    t.decimal "inss_discount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "proponents"
  add_foreign_key "proponent_phones", "proponents"
end
