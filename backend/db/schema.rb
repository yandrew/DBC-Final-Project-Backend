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

  create_table "bids", force: true do |t|
    t.boolean  "transaction", default: false
    t.integer  "listing_id"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["listing_id"], name: "index_bids_on_listing_id", using: :btree
  add_index "bids", ["offer_id"], name: "index_bids_on_offer_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["product_id"], name: "index_categories_on_product_id", using: :btree

  create_table "listings", force: true do |t|
    t.integer  "max_price"
    t.integer  "base_price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "offer_price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offers", ["user_id"], name: "index_offers_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "image_url"
    t.text     "description"
    t.string   "condition"
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["listing_id"], name: "index_products_on_listing_id", using: :btree
  add_index "products", ["offer_id"], name: "index_products_on_offer_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "score"
    t.text     "description"
    t.integer  "author_id"
    t.integer  "recipient_id"
    t.integer  "bid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["bid_id"], name: "index_ratings_on_bid_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "name"
    t.string   "email"
    t.text     "avatar"
    t.text     "bio"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
