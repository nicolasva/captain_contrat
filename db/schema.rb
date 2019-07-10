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

ActiveRecord::Schema.define(version: 2019_07_10_105021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fight_events", force: :cascade do |t|
    t.bigint "fights_id"
    t.string "attacker_name"
    t.integer "attack_type"
    t.integer "attack_damage"
    t.string "defender_name"
    t.integer "defend_type"
    t.integer "defender_health"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fights_id"], name: "index_fight_events_on_fights_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.bigint "heros_id"
    t.bigint "weapons_id"
    t.bigint "shields_id"
    t.text "hero_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heros_id"], name: "index_fighters_on_heros_id"
    t.index ["shields_id"], name: "index_fighters_on_shields_id"
    t.index ["weapons_id"], name: "index_fighters_on_weapons_id"
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "winners_id"
    t.bigint "losers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["losers_id"], name: "index_fights_on_losers_id"
    t.index ["winners_id"], name: "index_fights_on_winners_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "attack"
    t.integer "speed", default: 5
    t.integer "dodge_rate", default: 0
    t.integer "critical_rate", default: 0
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "power"
    t.integer "rank"
  end

  create_table "shields", force: :cascade do |t|
    t.string "name"
    t.integer "armor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "min_damage"
    t.integer "max_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
