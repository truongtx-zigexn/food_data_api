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

ActiveRecord::Schema[7.2].define(version: 2024_12_28_070634) do
  create_table "chosen_meals", force: :cascade do |t|
    t.string "meal_time"
    t.integer "qty"
    t.integer "plan_id", null: false
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_chosen_meals_on_meal_id"
    t.index ["plan_id"], name: "index_chosen_meals_on_plan_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "fdb_id"
    t.integer "qty"
    t.integer "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_ingredients_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physical_stats", force: :cascade do |t|
    t.integer "age"
    t.string "gender"
    t.float "height"
    t.float "weight"
    t.string "activity_lvl"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_physical_stats_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.date "apply_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chosen_meals", "meals"
  add_foreign_key "chosen_meals", "plans"
  add_foreign_key "ingredients", "meals"
  add_foreign_key "physical_stats", "users"
  add_foreign_key "plans", "users"
end