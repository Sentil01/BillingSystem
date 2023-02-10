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

ActiveRecord::Schema.define(version: 2023_02_10_182008) do

  create_table "amounts", force: :cascade do |t|
    t.integer "five_hundred", default: 0
    t.integer "hundred", default: 0
    t.integer "fifty", default: 0
    t.integer "ten", default: 0
    t.integer "five", default: 0
    t.integer "two", default: 0
    t.integer "one", default: 0
    t.integer "bill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_amounts_on_bill_id"
  end

  create_table "balance_denos", force: :cascade do |t|
    t.integer "c500"
    t.integer "c100"
    t.integer "c50"
    t.integer "c10"
    t.integer "c5"
    t.integer "c2"
    t.integer "c1"
    t.integer "bill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_id"], name: "index_balance_denos_on_bill_id"
  end

  create_table "bills", force: :cascade do |t|
    t.string "email_id"
    t.string "name"
    t.integer "amount_paid"
    t.integer "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "total_tax"
    t.float "total_amount"
    t.float "net_amount"
    t.integer "balance"
    t.index ["shop_id"], name: "index_bills_on_shop_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity"
    t.integer "bill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchased_price"
    t.float "tax_per_item"
    t.float "item_tax"
    t.index ["bill_id"], name: "index_carts_on_bill_id"
  end

  create_table "denominations", force: :cascade do |t|
    t.integer "five_hundred"
    t.integer "hundred"
    t.integer "fifty"
    t.integer "ten"
    t.integer "five"
    t.integer "two"
    t.integer "one"
    t.integer "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
    t.index ["shop_id"], name: "index_denominations_on_shop_id"
  end

  create_table "products", force: :cascade do |t|
    t.float "price"
    t.integer "tax"
    t.integer "quantity"
    t.integer "shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_name"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "amounts", "bills"
  add_foreign_key "balance_denos", "bills"
  add_foreign_key "bills", "shops"
  add_foreign_key "carts", "bills"
  add_foreign_key "denominations", "shops"
  add_foreign_key "products", "shops"
end
