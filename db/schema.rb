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

ActiveRecord::Schema.define(version: 20161013202459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendees", id: :bigserial, force: :cascade do |t|
    t.text    "name"
    t.boolean "time1vote"
    t.boolean "time2vote"
    t.boolean "time3vote"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creators", id: :bigserial, force: :cascade do |t|
    t.text "name"
    t.text "email"
  end

  create_table "events", id: :bigserial, force: :cascade do |t|
    t.text    "name"
    t.integer "creatorid"
    t.text    "uniqueurl"
    t.text    "description"
    t.text    "location"
    t.integer "event_date"
    t.text    "event_time"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "item_price_cents"
    t.integer  "total_price_cents"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "total_cents"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "stripe_charge_id"
    t.string   "email"
  end

  create_table "participants", id: :bigserial, force: :cascade do |t|
    t.integer "eventid"
    t.integer "attendeesid"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "price_cents"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "creators", column: "creatorid", name: "events_creatorid_fkey"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "participants", "attendees", column: "attendeesid", name: "participants_attendeesid_fkey"
  add_foreign_key "participants", "events", column: "eventid", name: "participants_eventid_fkey"
  add_foreign_key "products", "categories"
end
