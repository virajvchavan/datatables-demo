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

ActiveRecord::Schema.define(version: 20180909092212) do

  create_table "orders", force: :cascade do |t|
    t.string   "dish_name"
    t.string   "quantity"
    t.integer  "price"
    t.string   "location"
    t.datetime "order_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "custome_name"
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "salary"
    t.string   "country"
    t.date     "birth_date"
    t.string   "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "region"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "salary"
    t.string   "office"
    t.date     "start_date"
    t.string   "extn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
