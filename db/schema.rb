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

ActiveRecord::Schema.define(version: 20140923074425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: true do |t|
    t.string   "metro"
    t.string   "address",                                  null: false
    t.integer  "rooms"
    t.boolean  "only_room"
    t.boolean  "adjacent_rooms"
    t.float    "apartment_size"
    t.float    "kitchen_size"
    t.string   "rooms_size"
    t.string   "balcony"
    t.string   "repairing"
    t.integer  "floor"
    t.integer  "floors"
    t.string   "kitchen_furnished"
    t.boolean  "phone"
    t.boolean  "tv"
    t.boolean  "fridge"
    t.boolean  "washer"
    t.boolean  "animals"
    t.boolean  "kids"
    t.boolean  "bathroom_with_toilet"
    t.integer  "deposit"
    t.boolean  "deposit_divide"
    t.text     "comment"
    t.integer  "landlord_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.string   "made_from"
    t.boolean  "dressing_room"
    t.boolean  "tile_in_toilet"
    t.string   "living_area_size"
    t.boolean  "rent_before"
    t.boolean  "dishwasher"
    t.string   "stove"
    t.string   "internet"
    t.boolean  "water_meters"
    t.string   "registered_people"
    t.boolean  "registered_infants"
    t.boolean  "bed_2"
    t.boolean  "bed_1"
    t.boolean  "bed_0"
    t.boolean  "sliding_wardrobe"
    t.boolean  "wardrobe"
    t.boolean  "chest"
    t.boolean  "sofa"
    t.string   "photo_when"
    t.boolean  "near_supermarket"
    t.boolean  "near_park"
    t.boolean  "near_school"
    t.boolean  "near_hospital"
    t.boolean  "near_kindergarten"
    t.string   "pre_pay"
    t.string   "wishes"
    t.string   "how_long_wait"
    t.string   "how_long_rent"
    t.string   "experience_with_realtors"
    t.string   "other_realtors"
    t.boolean  "conditioner"
    t.string   "transport_to_metro"
    t.string   "time_to_metro"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_need"
    t.string   "status",                   default: "new"
    t.string   "when_see"
    t.string   "commission_agent"
    t.string   "commission_client"
  end

  add_index "apartments", ["landlord_id"], name: "index_apartments_on_landlord_id", using: :btree
  add_index "apartments", ["user_id"], name: "index_apartments_on_user_id", using: :btree

  create_table "assets", force: true do |t|
    t.integer  "apartment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assets", ["apartment_id"], name: "index_assets_on_apartment_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name",                                                null: false
    t.string   "passport"
    t.string   "mobile",          limit: 11,                          null: false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alternate_phone"
    t.string   "email"
    t.string   "object_relation"
    t.integer  "room"
    t.decimal  "price",                      precision: 10, scale: 2
    t.text     "comment"
  end

  add_index "clients", ["mobile"], name: "index_clients_on_mobile", using: :btree

  create_table "deals", force: true do |t|
    t.integer  "landlord_id",  null: false
    t.integer  "tenant_id",    null: false
    t.integer  "agent_id"
    t.integer  "apartment_id", null: false
    t.integer  "user_id",      null: false
    t.integer  "price",        null: false
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
  add_index "deals", ["landlord_id"], name: "index_deals_on_landlord_id", using: :btree
  add_index "deals", ["tenant_id"], name: "index_deals_on_tenant_id", using: :btree
  add_index "deals", ["user_id"], name: "index_deals_on_user_id", using: :btree

  create_table "feedback_messages", force: true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.string   "status"
    t.string   "ticket_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedback_messages", ["user_id"], name: "index_feedback_messages_on_user_id", using: :btree

  create_table "leads", force: true do |t|
    t.string   "name",                  null: false
    t.string   "mobile",                null: false
    t.string   "metro"
    t.string   "address"
    t.integer  "status",      limit: 2
    t.integer  "user_id"
    t.integer  "landlord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leads", ["landlord_id"], name: "index_leads_on_landlord_id", using: :btree
  add_index "leads", ["mobile"], name: "index_leads_on_mobile", using: :btree
  add_index "leads", ["name"], name: "index_leads_on_name", using: :btree
  add_index "leads", ["user_id"], name: "index_leads_on_user_id", using: :btree

  create_table "metros", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "id_on_cian"
    t.integer  "id_on_avito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metros", ["city"], name: "index_metros_on_city", using: :btree

  create_table "money", force: true do |t|
    t.string   "contractor"
    t.integer  "money_category_id"
    t.decimal  "amount",            precision: 10, scale: 2
    t.datetime "date"
    t.integer  "money_status_id"
    t.text     "description"
    t.integer  "deal_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "money", ["contractor"], name: "index_money_on_contractor", using: :btree
  add_index "money", ["deal_id"], name: "index_money_on_deal_id", using: :btree
  add_index "money", ["money_category_id"], name: "index_money_on_money_category_id", using: :btree
  add_index "money", ["money_status_id"], name: "index_money_on_money_status_id", using: :btree

  create_table "money_categories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "money_operations", force: true do |t|
    t.string   "contractor"
    t.integer  "category_id"
    t.integer  "status_id"
    t.integer  "deal_id"
    t.integer  "user_id"
    t.decimal  "amount",      precision: 10, scale: 2
    t.datetime "date"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "money_operations", ["category_id"], name: "index_money_operations_on_category_id", using: :btree
  add_index "money_operations", ["deal_id"], name: "index_money_operations_on_deal_id", using: :btree
  add_index "money_operations", ["status_id"], name: "index_money_operations_on_status_id", using: :btree
  add_index "money_operations", ["user_id"], name: "index_money_operations_on_user_id", using: :btree

  create_table "money_statuses", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                   null: false
    t.string   "email",                  null: false
    t.string   "password_salt",          null: false
    t.string   "password_hash",          null: false
    t.integer  "role",                   null: false
    t.datetime "last_sign_in_at"
    t.string   "last_sign_in_ip"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
