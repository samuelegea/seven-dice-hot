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

ActiveRecord::Schema[7.0].define(version: 2023_04_13_155147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_score_increases", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.integer "ability", null: false
    t.integer "bonus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_ability_score_increases_on_source"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "create_proficiency_sources", force: :cascade do |t|
    t.bigint "proficiency_id", null: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_create_proficiency_sources_on_proficiency_id"
    t.index ["source_type", "source_id"], name: "index_create_proficiency_sources_on_source"
  end

  create_table "custom_tables", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "column_name", null: false
    t.string "cell_value", null: false
    t.integer "cell_type", null: false
    t.integer "row_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_custom_tables_on_source"
  end

  create_table "equipment_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_categories_items", force: :cascade do |t|
    t.bigint "equipment_category_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_category_id"], name: "index_equipment_categories_items_on_equipment_category_id"
    t.index ["item_id"], name: "index_equipment_categories_items_on_item_id"
  end

  create_table "equipment_category_magic_items", force: :cascade do |t|
    t.bigint "magic_item_id", null: false
    t.bigint "equipment_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_category_id"], name: "index_equipment_category_magic_items_on_equipment_category_id"
    t.index ["magic_item_id"], name: "index_equipment_category_magic_items_on_magic_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "desc", null: false
    t.integer "cost_cp", null: false
    t.string "damage"
    t.integer "damage_type"
    t.integer "range_normal"
    t.integer "range_long"
    t.integer "weight"
    t.integer "throw_range_normal"
    t.integer "throw_range_long"
    t.string "two_handed_damage"
    t.json "custom"
    t.integer "armor_class"
    t.boolean "ac_dex_bonus"
    t.integer "max_bonus"
    t.integer "str_minimum"
    t.boolean "stealth_disadvantage"
    t.integer "speed_unit"
    t.integer "speed"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "two_handed_damage_type"
  end

  create_table "language_races", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_races_on_language_id"
    t.index ["race_id"], name: "index_language_races_on_race_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.integer "rarity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "script", null: false
  end

  create_table "magic_items", force: :cascade do |t|
    t.string "name", null: false
    t.text "desc", null: false
    t.integer "rarity", null: false
    t.boolean "variant", default: false, null: false
    t.bigint "variant_of_id"
    t.json "properties", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variant_of_id"], name: "index_magic_items_on_variant_of_id"
  end

  create_table "proficiencies", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "item_id"
    t.bigint "equipment_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "ability_score"
    t.index ["equipment_category_id"], name: "index_proficiencies_on_equipment_category_id"
    t.index ["item_id"], name: "index_proficiencies_on_item_id"
    t.index ["skill_id"], name: "index_proficiencies_on_skill_id"
  end

  create_table "proficiency_option_sources", force: :cascade do |t|
    t.bigint "proficiency_option_id", null: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_option_id"], name: "index_proficiency_option_sources_on_proficiency_option_id"
    t.index ["source_type", "source_id"], name: "index_proficiency_option_sources_on_source"
  end

  create_table "proficiency_options", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_proficiency_options_on_source"
  end

  create_table "proficiency_options_proficiency", force: :cascade do |t|
    t.bigint "proficiency_option_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_proficiency_options_proficiency_on_proficiency_id"
    t.index ["proficiency_option_id"], name: "index_proficiency_options_proficiency_on_proficiency_option_id"
  end

  create_table "proficiency_sources", force: :cascade do |t|
    t.bigint "proficiency_id", null: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_proficiency_sources_on_proficiency_id"
    t.index ["source_type", "source_id"], name: "index_proficiency_sources_on_source"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "speed"
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_races_on_parent_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "desc", default: "", null: false
    t.integer "ability_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", null: false
    t.text "desc", null: false
    t.integer "school", null: false
    t.integer "components", default: [], null: false, array: true
    t.string "material", null: false
    t.boolean "ritual", default: false, null: false
    t.integer "duration_number", default: 0, null: false
    t.integer "duration_unit", default: 0, null: false
    t.integer "duration_delimiter"
    t.boolean "concentration", default: false, null: false
    t.integer "casting_time_unit", default: 0, null: false
    t.integer "casting_time_number", default: 0, null: false
    t.integer "level", default: 0, null: false
    t.boolean "attack_type_melee", default: false
    t.integer "saving_throw", default: 0
    t.integer "dc_success"
    t.string "dc_desc"
    t.integer "aoe_type"
    t.integer "aoe_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "desc", default: "", null: false
    t.json "properties", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traits_races", force: :cascade do |t|
    t.bigint "trait_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_traits_races_on_race_id"
    t.index ["trait_id"], name: "index_traits_races_on_trait_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weapon_properties", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "desc", default: "", null: false
    t.json "properties", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_properties_items", force: :cascade do |t|
    t.bigint "weapon_property_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_weapon_properties_items_on_item_id"
    t.index ["weapon_property_id"], name: "index_weapon_properties_items_on_weapon_property_id"
  end

  add_foreign_key "create_proficiency_sources", "proficiencies"
  add_foreign_key "equipment_categories_items", "equipment_categories"
  add_foreign_key "equipment_categories_items", "items"
  add_foreign_key "equipment_category_magic_items", "equipment_categories"
  add_foreign_key "equipment_category_magic_items", "magic_items"
  add_foreign_key "language_races", "languages"
  add_foreign_key "language_races", "races"
  add_foreign_key "magic_items", "magic_items", column: "variant_of_id"
  add_foreign_key "proficiencies", "equipment_categories"
  add_foreign_key "proficiencies", "items"
  add_foreign_key "proficiencies", "skills"
  add_foreign_key "proficiency_option_sources", "proficiency_options"
  add_foreign_key "proficiency_options_proficiency", "proficiencies"
  add_foreign_key "proficiency_options_proficiency", "proficiency_options"
  add_foreign_key "proficiency_sources", "proficiencies"
  add_foreign_key "races", "races", column: "parent_id"
  add_foreign_key "traits_races", "races"
  add_foreign_key "traits_races", "traits"
  add_foreign_key "weapon_properties_items", "items"
  add_foreign_key "weapon_properties_items", "weapon_properties"
end
