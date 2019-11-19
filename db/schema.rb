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


ActiveRecord::Schema.define(version: 2019_11_18_055801) do

  create_table "arrivals", force: :cascade do |t|
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "count"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_read"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name_read"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "discs", force: :cascade do |t|
    t.integer "number"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "status", default: 0
    t.integer "payment_method"
    t.integer "total_amount"
    t.integer "subtotal_amount"
    t.string "contractee_name"
    t.string "contractee_phone_number"
    t.string "postal_code"
    t.string "destination_name"
    t.string "destination_address"
    t.string "destination_phone_number"
    t.integer "postage", default: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractee_name"], name: "index_orders_on_contractee_name"
  end

  create_table "products", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "record_label_id"
    t.integer "format"
    t.integer "category_id"
    t.integer "status", default: 0
    t.string "title"
    t.string "image_id"
    t.integer "price"
    t.boolean "active_flag", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "sales_date"
    t.index ["title"], name: "index_products_on_title"
  end

  create_table "purchased_products", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registration_addresses", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "postal_code"
    t.string "address"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.string "title"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recording_time_minutes"
    t.integer "recording_time_seconds"
  end

end
