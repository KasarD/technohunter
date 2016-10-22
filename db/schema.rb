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

ActiveRecord::Schema.define(version: 20161022082608) do

  create_table "vehicles", force: :cascade do |t|
    t.string   "type",           limit: 255,                            default: "-",   null: false
    t.string   "vehicle_type",   limit: 255,                                            null: false
    t.string   "body",           limit: 255,                            default: "-",   null: false
    t.text     "description",    limit: 65535
    t.string   "engine",         limit: 10,                             default: "-",   null: false
    t.string   "engine_cap",     limit: 5,                              default: "0",   null: false
    t.string   "kpp",            limit: 255,                            default: "-",   null: false
    t.boolean  "moderate",                                              default: false, null: false
    t.integer  "vehicle_status", limit: 4,                              default: 1,     null: false
    t.decimal  "price",                        precision: 14, scale: 2, default: 0.0,   null: false
    t.string   "drive",          limit: 255,                            default: "-",   null: false
    t.integer  "mileage",        limit: 4,                              default: 0,     null: false
    t.integer  "status",         limit: 4,                              default: 0,     null: false
    t.string   "vin_code",       limit: 255,                            default: "-",   null: false
    t.string   "year",           limit: 4,                              default: "-",   null: false
    t.integer  "h_of_use",       limit: 4,                              default: 0,     null: false
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

end
