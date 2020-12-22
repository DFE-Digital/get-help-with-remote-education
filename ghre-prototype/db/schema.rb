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

ActiveRecord::Schema.define(version: 2020_12_22_143425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "reference_code"
    t.string "school_type"
    t.index ["reference_code"], name: "index_answers_on_reference_code", unique: true
  end

  create_table "leadership_answers", force: :cascade do |t|
    t.integer "question_one"
    t.integer "question_two"
    t.bigint "answers_id"
    t.index ["answers_id"], name: "index_leadership_answers_on_answers_id"
  end

  add_foreign_key "leadership_answers", "answers", column: "answers_id"
end
