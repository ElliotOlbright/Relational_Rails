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

ActiveRecord::Schema.define(version: 2021_07_14_202119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.string "make"
    t.string "year"
    t.boolean "under_100k_miles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dealership_id"
    t.index ["dealership_id"], name: "index_cars_on_dealership_id"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.boolean "open_weekends"
    t.integer "years_open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groceries", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grocery_store_id"
    t.index ["grocery_store_id"], name: "index_groceries_on_grocery_store_id"
  end

  create_table "grocery_stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.boolean "open_24_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "departments"
  end

  add_foreign_key "cars", "dealerships"
  add_foreign_key "groceries", "grocery_stores"
end
