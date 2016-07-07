# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160707144624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_infos", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "street_name"
    t.integer  "street_number"
    t.integer  "phone_number"
    t.string   "phone_prefix"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "order_id"
  end

  add_index "delivery_infos", ["order_id"], name: "index_delivery_infos_on_order_id", using: :btree
  add_index "delivery_infos", ["user_id"], name: "index_delivery_infos_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "photo"
    t.integer  "specification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "images", ["specification_id"], name: "index_images_on_specification_id", using: :btree

  create_table "order_lines", force: :cascade do |t|
    t.string   "size"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "order_id"
    t.integer  "price"
    t.integer  "product_id"
    t.string   "color"
    t.integer  "specification_id"
  end

  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id", using: :btree
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id", using: :btree
  add_index "order_lines", ["specification_id"], name: "index_order_lines_on_specification_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "state"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "description"
    t.string   "season"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "price_cents", default: 0, null: false
    t.string   "photo"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "street_name"
    t.integer  "street_number"
    t.integer  "phone_number"
    t.string   "phone_number_prefix"
    t.boolean  "admin"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "specifications", force: :cascade do |t|
    t.string   "code_article"
    t.string   "color"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "product_id"
    t.string   "size"
    t.integer  "quantity"
  end

  add_index "specifications", ["product_id"], name: "index_specifications_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "delivery_infos", "orders"
  add_foreign_key "delivery_infos", "users"
  add_foreign_key "images", "specifications"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "order_lines", "specifications"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "profiles", "users"
  add_foreign_key "specifications", "products"
end
