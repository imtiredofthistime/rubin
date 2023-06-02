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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_185522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.integer "year"
    t.string "facility_type"
    t.string "city"
    t.string "mortality"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "clinic_id", null: false
    t.index ["clinic_id"], name: "index_departments_on_clinic_id"
  end

  create_table "doctor_patients", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.index ["doctor_id"], name: "index_doctor_patients_on_doctor_id"
    t.index ["patient_id"], name: "index_doctor_patients_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.bigint "department_id", null: false
    t.bigint "specialty_id", null: false
    t.index ["department_id"], name: "index_doctors_on_department_id"
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id"
  end

  create_table "patient_cards", force: :cascade do |t|
    t.bigint "clinic_id"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_patient_cards_on_clinic_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "patient_card_id"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.integer "age"
    t.index ["patient_card_id"], name: "index_patients_on_patient_card_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "departments", "clinics"
  add_foreign_key "doctor_patients", "doctors"
  add_foreign_key "doctor_patients", "patients"
  add_foreign_key "doctors", "departments"
  add_foreign_key "doctors", "specialties"
  add_foreign_key "patient_cards", "clinics"
  add_foreign_key "patients", "patient_cards"
end
