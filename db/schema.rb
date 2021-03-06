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

ActiveRecord::Schema.define(version: 20151015044027) do

  create_table "competitions", force: :cascade do |t|
    t.string   "competition_name"
    t.text     "competition_des"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "no_of_rounds"
  end

  create_table "judges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string   "p_name"
    t.string   "p_loc"
    t.string   "p_phone"
    t.string   "p_email"
    t.string   "p_des"
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.string   "round_name"
    t.text     "round_des"
    t.integer  "no_of_participants"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "competition_id"
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
