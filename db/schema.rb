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

ActiveRecord::Schema.define(version: 20160810072814) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "order_cost",           precision: 8, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "store_product_id",   limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["store_product_id"], name: "index_pictures_on_store_product_id", using: :btree

  create_table "product_types", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "product_type",        limit: 255
    t.string   "brand",               limit: 255
    t.string   "manufacturer",        limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "description",         limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.datetime "deleted_at"
    t.string   "qr_path",             limit: 255
  end

  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree

  create_table "store_order_items", force: :cascade do |t|
    t.decimal  "price",                      precision: 8, scale: 2
    t.integer  "quantity",         limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "store_order_id",   limit: 4
    t.integer  "store_product_id", limit: 4
  end

  add_index "store_order_items", ["store_order_id"], name: "index_store_order_items_on_store_order_id", using: :btree
  add_index "store_order_items", ["store_product_id"], name: "index_store_order_items_on_store_product_id", using: :btree

  create_table "store_orders", force: :cascade do |t|
    t.decimal  "total_cost",           precision: 5, scale: 2
    t.integer  "status",     limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "store_id",   limit: 4
    t.integer  "order_id",   limit: 4
  end

  add_index "store_orders", ["order_id"], name: "index_store_orders_on_order_id", using: :btree
  add_index "store_orders", ["store_id"], name: "index_store_orders_on_store_id", using: :btree

  create_table "store_products", force: :cascade do |t|
    t.decimal  "price",                           precision: 10, scale: 2
    t.integer  "stock",               limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "store_id",            limit: 4
    t.integer  "product_id",          limit: 4
    t.string   "description",         limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "qr_code_path",        limit: 255
    t.datetime "deleted_at"
  end

  add_index "store_products", ["deleted_at"], name: "index_store_products_on_deleted_at", using: :btree
  add_index "store_products", ["product_id"], name: "index_store_products_on_product_id", using: :btree
  add_index "store_products", ["store_id"], name: "index_store_products_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "contact",             limit: 255
    t.string   "location",            limit: 255
    t.string   "category",            limit: 255
    t.decimal  "average_sales",                   precision: 10
    t.string   "description",         limit: 255
    t.string   "website",             limit: 255
    t.string   "facebook_page",       limit: 255
    t.string   "twitter_page",        limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "user_id",             limit: 4
    t.datetime "deleted_at"
    t.string   "opening_time",        limit: 255
    t.string   "closing_time",        limit: 255
  end

  add_index "stores", ["deleted_at"], name: "index_stores_on_deleted_at", using: :btree
  add_index "stores", ["user_id"], name: "index_stores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "password",               limit: 255
    t.string   "login_status",           limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "user_type",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variant_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "variant_values", force: :cascade do |t|
    t.string   "value",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "variant_type_id", limit: 4
  end

  add_index "variant_values", ["variant_type_id"], name: "index_variant_values_on_variant_type_id", using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "value",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "store_product_id", limit: 4
  end

  add_foreign_key "orders", "users"
  add_foreign_key "pictures", "store_products"
  add_foreign_key "store_order_items", "store_orders"
  add_foreign_key "store_order_items", "store_products"
  add_foreign_key "store_orders", "orders"
  add_foreign_key "store_orders", "stores"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "stores", "users"
  add_foreign_key "variant_values", "variant_types"
end
