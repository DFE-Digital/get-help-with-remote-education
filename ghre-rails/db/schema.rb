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

ActiveRecord::Schema.define(version: 2021_02_03_145813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reference_code"
    t.string "login_code"
    t.index ["reference_code"], name: "index_answers_on_reference_code", unique: true
  end

  create_table "details", force: :cascade do |t|
    t.string "which_educational_stage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_details_on_answer_id"
  end

  create_table "leaderships", force: :cascade do |t|
    t.bigint "answer_id"
    t.integer "remote_education_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "communication"
    t.integer "monitoring_and_evaluating"
    t.text "remote_education_plan_notes"
    t.text "communication_notes"
    t.text "monitoring_and_evaluating_notes"
    t.index ["answer_id"], name: "index_leaderships_on_answer_id"
  end

  add_foreign_key "details", "answers"
  add_foreign_key "leaderships", "answers"
end
