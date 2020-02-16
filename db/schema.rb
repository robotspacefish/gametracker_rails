# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_16_215829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "summary"
    t.string "igdb_id"
    t.boolean "custom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "added_by"
  end

  create_table "games_platforms", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "platform_id"
    t.index ["game_id"], name: "index_games_platforms_on_game_id"
    t.index ["platform_id"], name: "index_games_platforms_on_platform_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.boolean "completed"
    t.bigint "owned_game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owned_game_id"], name: "index_notes_on_owned_game_id"
  end

  create_table "owned_games", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.boolean "currently_playing"
    t.boolean "want_to_play"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_owned_games_on_game_id"
    t.index ["user_id"], name: "index_owned_games_on_user_id"
  end

  create_table "owned_games_platforms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "games_platform_id"
    t.index ["games_platform_id"], name: "index_owned_games_platforms_on_games_platform_id"
    t.index ["user_id"], name: "index_owned_games_platforms_on_user_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
