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

ActiveRecord::Schema.define(version: 20181124180857) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pathology_lab_test_id"
    t.bigint "patient_id"
    t.date "appointment_date"
    t.time "appointment_time"
    t.string "attachment"
    t.index ["pathology_lab_test_id"], name: "index_appointments_on_pathology_lab_test_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "path_test_fixed_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pathology_lab_test_id"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pathology_lab_test_id"], name: "index_path_test_fixed_times_on_pathology_lab_test_id"
  end

  create_table "pathology_lab_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pathologylab_id"
    t.bigint "test_id"
    t.integer "cost"
    t.integer "total_seats"
    t.index ["pathologylab_id"], name: "index_pathology_lab_tests_on_pathologylab_id"
    t.index ["test_id"], name: "index_pathology_lab_tests_on_test_id"
  end

  create_table "pathologylabs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.text "address", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_pathologylabs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pathologylabs_on_reset_password_token", unique: true
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.text "address", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "test_path_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time"
    t.bigint "pathology_lab_test_id"
    t.integer "total_seats"
    t.integer "occupied_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pathology_lab_test_id"], name: "index_test_path_times_on_pathology_lab_test_id"
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "pathology_lab_tests"
  add_foreign_key "appointments", "patients"
  add_foreign_key "path_test_fixed_times", "pathology_lab_tests"
  add_foreign_key "pathology_lab_tests", "pathologylabs"
  add_foreign_key "pathology_lab_tests", "tests"
  add_foreign_key "test_path_times", "pathology_lab_tests"
end
