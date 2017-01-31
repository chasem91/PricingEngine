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

ActiveRecord::Schema.define(version: 20170130032340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_price_rules", force: :cascade do |t|
    t.float    "base_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixed_discount_by_gender_rules", force: :cascade do |t|
    t.string   "gender",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "discount"
  end

  create_table "fixed_increase_by_age_rules", force: :cascade do |t|
    t.integer  "base_age",     null: false
    t.integer  "age_interval", null: false
    t.float    "amount",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "min_age_rules", force: :cascade do |t|
    t.integer  "minimum_age", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "percent_discount_by_region_rules", force: :cascade do |t|
    t.string   "region",     null: false
    t.float    "percent",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "percent_increase_by_condition_rules", force: :cascade do |t|
    t.string   "condition",  null: false
    t.float    "percent",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "company_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.integer  "plan_id",       null: false
    t.integer  "ruleable_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ruleable_type"
  end
end
