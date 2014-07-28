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

ActiveRecord::Schema.define(version: 20140728115546) do

  create_table "apartments", force: true do |t|
    t.string   "metro"
    t.string   "address"
    t.integer  "rooms"
    t.boolean  "only_room"
    t.boolean  "adjacent_rooms"
    t.float    "apartment_size"
    t.float    "kitchen_size"
    t.string   "rooms_size"
    t.float    "balcony_size"
    t.boolean  "balcony"
    t.boolean  "balcony_glazed"
    t.boolean  "repairing"
    t.integer  "floor"
    t.integer  "floors"
    t.boolean  "furnished"
    t.boolean  "kitchen_furnished"
    t.boolean  "phone"
    t.boolean  "tv"
    t.boolean  "fridge"
    t.boolean  "washer"
    t.boolean  "animals"
    t.boolean  "kids"
    t.boolean  "bathroom_with_toilet"
    t.integer  "deposit"
    t.boolean  "deposit_divide"
    t.string   "near"
    t.string   "when_see"
    t.string   "when_placed"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "deals", force: true do |t|
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
    t.integer  "landlord_id"
    t.integer  "tenant_id"
  end

  add_index "deals", ["agent_id"], name: "index_deals_on_agent_id", using: :btree
  add_index "deals", ["apartment_id"], name: "index_deals_on_apartment_id", using: :btree
  add_index "deals", ["landlord_id"], name: "index_deals_on_landlord_id", using: :btree
  add_index "deals", ["tenant_id"], name: "index_deals_on_tenant_id", using: :btree
  add_index "deals", ["user_id"], name: "index_deals_on_user_id", using: :btree

  create_table "landlords", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "passport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "from_lead"
  end

  add_index "landlords", ["name"], name: "index_landlords_on_name", using: :btree

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.integer  "apartment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "landlord_id"
  end

  add_index "leads", ["apartment_id"], name: "index_leads_on_apartment_id", using: :btree
  add_index "leads", ["landlord_id"], name: "index_leads_on_landlord_id", using: :btree
  add_index "leads", ["name"], name: "index_leads_on_name", using: :btree

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
