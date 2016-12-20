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

ActiveRecord::Schema.define(version: 20161126213007) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "message"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.boolean  "accepted",    default: false, null: false
    t.boolean  "denied",      default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["activity_id"], name: "index_activity_users_on_activity_id"
    t.index ["user_id"], name: "index_activity_users_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_to_id"
    t.integer  "user_from_id"
    t.string   "message_body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_from_id"], name: "index_messages_on_user_from_id"
    t.index ["user_to_id"], name: "index_messages_on_user_to_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.text     "comment"
    t.float    "score"
    t.integer  "user_id"
    t.integer  "rater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rater_id"], name: "index_ratings_on_rater_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email",                                                                                                     null: false
    t.string   "uid",                    default: "",                                                                                                          null: false
    t.string   "username",               default: "",                                                                                                          null: false
    t.string   "city",                   default: "",                                                                                                          null: false
    t.string   "state",                  default: "",                                                                                                          null: false
    t.text     "bio",                    default: "",                                                                                                          null: false
    t.integer  "zip",                    default: 0,                                                                                                           null: false
    t.string   "encrypted_password",     default: "",                                                                                                          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                                                                           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image",                  default: "https://static1.squarespace.com/static/557d1981e4b097936a86b629/t/558cf487e4b05d368538793a/1435301000191/", null: false
    t.string   "largeImage",             default: "https://static1.squarespace.com/static/557d1981e4b097936a86b629/t/558cf487e4b05d368538793a/1435301000191/", null: false
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at",                                                                                                                                   null: false
    t.datetime "updated_at",                                                                                                                                   null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
