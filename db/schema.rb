ActiveRecord::Schema.define(version: 2021_07_07_174330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  #Dealership and Cars Schema
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
  #Grocery Store and Groceries Schema
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
  end
  #Keys
  add_foreign_key "cars", "dealerships"
  add_foreign_key "groceries", "grocery_stores"
end
