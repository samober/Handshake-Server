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

ActiveRecord::Schema.define(version: 20150714015611) do

  create_table "addresses", force: true do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "label"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["card_id"], name: "index_addresses_on_card_id"

  create_table "beta_requests", force: true do |t|
    t.string   "email"
    t.string   "device"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "black_listeds", force: true do |t|
    t.integer  "user_id"
    t.integer  "black_listed_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "black_listeds", ["black_listed_user_id"], name: "index_black_listeds_on_black_listed_user_id"
  add_index "black_listeds", ["user_id"], name: "index_black_listeds_on_user_id"

  create_table "cards", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "cards_friendships", force: true do |t|
    t.integer "card_id"
    t.integer "friendship_id"
  end

  add_index "cards_friendships", ["card_id", "friendship_id"], name: "index_cards_friendships_on_card_id_and_friendship_id"
  add_index "cards_friendships", ["card_id"], name: "index_cards_friendships_on_card_id"
  add_index "cards_friendships", ["friendship_id"], name: "index_cards_friendships_on_friendship_id"

  create_table "cards_group_members", force: true do |t|
    t.integer "card_id"
    t.integer "group_member_id"
  end

  add_index "cards_group_members", ["card_id", "group_member_id"], name: "index_cards_group_members_on_card_id_and_group_member_id"
  add_index "cards_group_members", ["card_id"], name: "index_cards_group_members_on_card_id"
  add_index "cards_group_members", ["group_member_id"], name: "index_cards_group_members_on_group_member_id"

  create_table "contact_data_entries", force: true do |t|
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_data_entries", ["email"], name: "index_contact_data_entries_on_email"
  add_index "contact_data_entries", ["phone"], name: "index_contact_data_entries_on_phone"

  create_table "contact_data_entries_users", force: true do |t|
    t.integer "contact_data_entry_id"
    t.integer "user_id"
  end

  add_index "contact_data_entries_users", ["contact_data_entry_id"], name: "index_contact_data_entries_users_on_contact_data_entry_id"
  add_index "contact_data_entries_users", ["user_id"], name: "index_contact_data_entries_users_on_user_id"

  create_table "devices", force: true do |t|
    t.string   "token"
    t.string   "platform"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "emails", force: true do |t|
    t.string   "address"
    t.string   "label"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["address"], name: "index_emails_on_address"
  add_index "emails", ["card_id"], name: "index_emails_on_card_id"

  create_table "feed_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.integer  "group_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feed_items", ["contact_id"], name: "index_feed_items_on_contact_id"
  add_index "feed_items", ["group_id"], name: "index_feed_items_on_group_id"
  add_index "feed_items", ["user_id", "contact_id", "group_id"], name: "index_feed_items_on_user_id_and_contact_id_and_group_id"
  add_index "feed_items", ["user_id", "contact_id"], name: "index_feed_items_on_user_id_and_contact_id"
  add_index "feed_items", ["user_id", "group_id"], name: "index_feed_items_on_user_id_and_group_id"
  add_index "feed_items", ["user_id"], name: "index_feed_items_on_user_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.boolean  "accepted"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["contact_id", "accepted"], name: "index_friendships_on_contact_id_and_accepted"
  add_index "friendships", ["contact_id", "is_deleted"], name: "index_friendships_on_contact_id_and_is_deleted"
  add_index "friendships", ["contact_id"], name: "index_friendships_on_contact_id"
  add_index "friendships", ["user_id", "accepted"], name: "index_friendships_on_user_id_and_accepted"
  add_index "friendships", ["user_id", "contact_id"], name: "index_friendships_on_user_id_and_contact_id"
  add_index "friendships", ["user_id", "is_deleted"], name: "index_friendships_on_user_id_and_is_deleted"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "group_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id"
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["code"], name: "index_groups_on_code"

  create_table "notifications_settings", force: true do |t|
    t.integer  "user_id"
    t.boolean  "enabled"
    t.boolean  "requests"
    t.boolean  "new_contacts"
    t.boolean  "new_group_members"
    t.boolean  "new_contact_information"
    t.boolean  "contact_joined"
    t.boolean  "suggestions"
    t.boolean  "new_features"
    t.boolean  "offers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications_settings", ["user_id"], name: "index_notifications_settings_on_user_id"

  create_table "phones", force: true do |t|
    t.string   "number"
    t.string   "label"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
  end

  add_index "phones", ["card_id"], name: "index_phones_on_card_id"
  add_index "phones", ["number"], name: "index_phones_on_number"

  create_table "socials", force: true do |t|
    t.string   "username"
    t.string   "network"
    t.string   "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "socials", ["card_id"], name: "index_socials_on_card_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.float    "lat",                    default: -1000.0
    t.float    "lng",                    default: -1000.0
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
