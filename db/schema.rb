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

ActiveRecord::Schema.define(version: 2020_12_06_230041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "contact_details"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end ####needs to reference games being borrowed

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_games", force: :cascade do |t|
    t.integer "category_id"
    t.integer "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.integer "borrower_id"
    t.integer "user_id"
    t.integer "min_players"
    t.integer "max_players"
    t.boolean "available"
    t.integer "category_id"
    t.string "description"
    t.string "contents"
    t.string "missing_damage"
    t.text "box_art"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "borrower_id"
    t.string "contact"
    t.string "borrower_history"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
  end

end
