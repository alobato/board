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

ActiveRecord::Schema.define(:version => 20120607141207) do

  create_table "assignments", :force => true do |t|
    t.integer  "dashboard_id"
    t.integer  "metric_id"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "dashboards", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "metrics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "dashboard_id"
    t.string   "value_type"
    t.string   "string_value"
    t.integer  "integer_value"
    t.decimal  "decimal_value", :precision => 10, :scale => 2
    t.integer  "position"
    t.string   "color"
    t.integer  "width"
    t.integer  "font_size"
    t.integer  "refresh_every"
  end

  create_table "values", :force => true do |t|
    t.integer  "metric_id"
    t.decimal  "decimal_value", :precision => 10, :scale => 2
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.datetime "generated_at"
  end

end
