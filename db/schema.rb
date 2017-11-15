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

ActiveRecord::Schema.define(version: 20171114155932) do

  create_table "customers", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "customer_first_name", null: false
    t.string "customer_last_name", null: false
    t.string "street_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "payment_method_name", null: false
    t.string "account_number", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payment_methods_on_customer_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "product_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_type_id", null: false
    t.string "product_name", null: false
    t.decimal "product_price", precision: 6, scale: 2, null: false
    t.string "product_desc", null: false
    t.integer "quantity"
    t.string "product_location"
    t.string "product_picture_file_name"
    t.string "product_picture_content_type"
    t.integer "product_picture_file_size"
    t.datetime "product_picture_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_products_on_customer_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

end
