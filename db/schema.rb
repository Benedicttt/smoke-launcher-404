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

ActiveRecord::Schema.define(version: 20171107101916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cookies", force: :cascade do |t|
    t.jsonb  "cookies_traider"
    t.string "stage"
    t.string "email"
    t.string "reset_password_token"
    t.string "authtoken"
    t.string "welcome_coupon"
  end

  create_table "partners", force: :cascade do |t|
    t.string   "skype"
    t.string   "nickname"
    t.string   "card"
    t.string   "driver"
    t.string   "email"
    t.string   "refcode"
    t.string   "locale"
    t.string   "stage_number"
    t.string   "phone"
    t.boolean  "tariff_first"
    t.boolean  "tariff_last"
    t.boolean  "cpa_first"
    t.boolean  "cpa_last"
    t.string   "platform"
    t.integer  "link_partner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "referall"
    t.string   "bonuse_code"
    t.string   "branch"
    t.boolean  "cpl_soi"
    t.boolean  "cpl_doi"
    t.jsonb    "cookies"
    t.string   "ip_address"
  end

  create_table "que_jobs", primary_key: ["queue", "priority", "run_at", "job_id"], force: :cascade, comment: "3" do |t|
    t.integer   "priority",    limit: 2, default: 100,            null: false
    t.datetime  "run_at",                default: -> { "now()" }, null: false
    t.bigserial "job_id",                                         null: false
    t.text      "job_class",                                      null: false
    t.json      "args",                  default: [],             null: false
    t.integer   "error_count",           default: 0,              null: false
    t.text      "last_error"
    t.text      "queue",                 default: "",             null: false
  end

  create_table "reports_partners", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "platform"
    t.string   "stage"
    t.text     "report"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports_users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "platform"
    t.string   "stage"
    t.text     "report"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "locale"
    t.string   "currency"
    t.string   "stage_number"
    t.string   "geo_locale"
    t.string   "platform"
    t.boolean  "email_confirmed"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "driver"
    t.boolean  "phone_verifed"
    t.string   "wire_capital"
    t.string   "ecommpay"
    t.string   "card_pay"
    t.boolean  "document_verifed"
    t.string   "status"
    t.string   "refcode"
    t.integer  "partner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "branch"
    t.integer  "tariff"
    t.string   "ip_address"
  end

end
