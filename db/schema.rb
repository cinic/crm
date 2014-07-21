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

ActiveRecord::Schema.define(version: 20140721204706) do

  create_table "deals", force: true do |t|
    t.integer  "employer_id"
    t.integer  "renter_id"
    t.integer  "agent_id"
    t.integer  "apartment_id"
    t.integer  "user_id"
    t.integer  "price"
    t.integer  "deposit"
    t.boolean  "communal"
    t.integer  "lease_term"
    t.integer  "commission"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["agent_id"], name: "index_deals_on_agent_id", using: :btree
  add_index "deals", ["apartment_id"], name: "index_deals_on_apartment_id", using: :btree
  add_index "deals", ["employer_id"], name: "index_deals_on_employer_id", using: :btree
  add_index "deals", ["renter_id"], name: "index_deals_on_renter_id", using: :btree
  add_index "deals", ["user_id"], name: "index_deals_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_salt"
    t.string   "password_hash"
    t.integer  "role"
    t.datetime "last_login"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
