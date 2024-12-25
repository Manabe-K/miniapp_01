# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_25_083338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "sake_tags", force: :cascade do |t|
    t.integer "sake_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sake_id", "tag_id"], name: "index_sake_tags_on_sake_id_and_tag_id", unique: true
  end

  create_table "sakes", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "sake_meter_value", precision: 5, scale: 1, null: false
    t.integer "price", null: false
    t.integer "prefecture", null: false
    t.string "label_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "label_genre", default: 0, null: false
    t.integer "type_of_sake", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sake_tags", "sakes"
  add_foreign_key "sake_tags", "tags"
end
