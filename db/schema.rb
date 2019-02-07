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

ActiveRecord::Schema.define(version: 2019_02_06_200952) do

  create_table "bar_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_numbers_on_bar_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_memories", force: :cascade do |t|
    t.string "body"
    t.integer "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_line_memories_on_line_id"
  end

  create_table "line_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_line_numbers_on_line_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memories", force: :cascade do |t|
    t.string "body"
    t.integer "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_memories_on_bar_id"
  end

  create_table "sca_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "Scatter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Scatter_id"], name: "index_sca_numbers_on_Scatter_id"
  end

  create_table "scat_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "scatter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scatter_id"], name: "index_scat_numbers_on_scatter_id"
  end

  create_table "scata_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "scatter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scatter_id"], name: "index_scata_numbers_on_scatter_id"
  end

  create_table "scatter_numbers", force: :cascade do |t|
    t.float "number"
    t.integer "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_scatter_numbers_on_line_id"
  end

  create_table "scatters", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
