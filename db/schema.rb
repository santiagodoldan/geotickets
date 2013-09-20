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

ActiveRecord::Schema.define(:version => 20130916170855) do

  create_table "plannings", :force => true do |t|
    t.float    "hours"
    t.date     "on"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sprints", :force => true do |t|
    t.string   "display_name"
    t.integer  "status"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "sprint_id"
  end

  add_index "stories", ["sprint_id"], :name => "index_stories_on_sprint_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "display_name"
    t.integer  "user_id"
    t.integer  "story_id"
    t.text     "description"
    t.float    "estimation",   :default => 0.0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "tickets", ["story_id"], :name => "index_tickets_on_story_id"
  add_index "tickets", ["user_id"], :name => "index_tickets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "hours_of_work"
    t.string   "feng_username"
    t.string   "feng_password"
    t.string   "feng_url"
    t.integer  "feng_project_id"
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
