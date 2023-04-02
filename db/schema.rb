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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_110929) do
  create_table "employees", force: :cascade do |t|
    t.string "employee_number", null: false
    t.string "name", null: false
    t.string "employment_status", null: false
    t.string "section", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_number"], name: "index_employees_on_employee_number", unique: true
  end

  create_table "working_times", force: :cascade do |t|
    t.datetime "begin"
    t.datetime "end"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_working_times_on_employee_id"
  end

  add_foreign_key "working_times", "employees"
end
