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

ActiveRecord::Schema.define(version: 20140320002220) do

  create_table "bulletins", force: true do |t|
    t.string   "content"
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bulletins", ["created_at"], name: "index_bulletins_on_created_at"

  create_table "circiuts", force: true do |t|
    t.string   "url"
    t.integer  "designer_id"
    t.integer  "daemon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circiuts", ["designer_id", "created_at", "daemon_id"], name: "index_circiuts_on_designer_id_and_created_at_and_daemon_id"

  create_table "daemons", force: true do |t|
    t.string   "name"
    t.string   "phase"
    t.string   "desire"
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "daemons", ["designer_id", "created_at"], name: "index_daemons_on_designer_id_and_created_at"

  create_table "designers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "designers", ["email"], name: "index_designers_on_email", unique: true
  add_index "designers", ["remember_token"], name: "index_designers_on_remember_token"

  create_table "pushes", force: true do |t|
    t.string   "content"
    t.integer  "pushable_id"
    t.string   "pushable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pushes", ["pushable_type", "pushable_id", "created_at"], name: "pushes_on_pushable_by_created_at"

end
