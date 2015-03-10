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

ActiveRecord::Schema.define(version: 20150306205015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name", default: "None"
  end

  create_table "listings", force: true do |t|
    t.float    "max_price"
    t.float    "accept_price", default: 0.0
    t.integer  "user_id"
    t.datetime "expires_at"
    t.integer  "rating_id"
    t.boolean  "closed",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.float    "offer_price"
    t.integer  "user_id"
    t.integer  "rating_id"
    t.integer  "listing_id"
    t.boolean  "valid",       default: true
    t.boolean  "purchased",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "image_url"
    t.text     "description"
    t.string   "condition"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "listing_id"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "score"
    t.text     "description"
    t.integer  "author_id"
    t.integer  "recipient_id"
    t.boolean  "listing",      default: false
    t.boolean  "offer",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "name"
    t.string   "email"
    t.text     "avatar"
    t.text     "bio"
    t.integer  "seller_rating"
    t.integer  "buyer_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
