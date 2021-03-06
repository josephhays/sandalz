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

ActiveRecord::Schema.define(version: 20180117174308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "inventory_skus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descriptive_id", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.text "description"
    t.integer "quantity"
    t.decimal "price_adjustment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "work_order_id"
    t.bigint "inventory_sku_id"
    t.index ["inventory_sku_id"], name: "index_line_items_on_inventory_sku_id"
    t.index ["work_order_id"], name: "index_line_items_on_work_order_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.date "started_on"
    t.date "closed_on"
    t.text "notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
