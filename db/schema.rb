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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130723021444) do

  create_table "epics", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "active"
    t.string   "system_ticket_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "epic_id"
    t.text     "description"
    t.float    "estimation",       :default => 0.0
    t.float    "todo",             :default => 0.0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "system_ticket_id"
  end

  add_index "tickets", ["epic_id"], :name => "index_tickets_on_epic_id"
  add_index "tickets", ["user_id"], :name => "index_tickets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "hours_of_work"
  end

  create_table "worked_hours", :force => true do |t|
    t.decimal  "amount",      :precision => 22, :scale => 20
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.date     "on"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "tag_id"
    t.text     "description"
  end

  add_index "worked_hours", ["ticket_id"], :name => "index_worked_hours_on_ticket_id"
  add_index "worked_hours", ["user_id"], :name => "index_worked_hours_on_user_id"

end
