# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171119005125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lab_tests", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "work_order_id"
    t.integer  "test_status_id"
    t.integer  "test_type_id"
    t.integer  "test_type_version_id"
    t.integer  "specimen_id"
    t.integer  "tested_by_id"
    t.jsonb    "data"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lab_tests", ["specimen_id"], name: "index_lab_tests_on_specimen_id", using: :btree
  add_index "lab_tests", ["test_status_id"], name: "index_lab_tests_on_test_status_id", using: :btree
  add_index "lab_tests", ["test_type_id"], name: "index_lab_tests_on_test_type_id", using: :btree
  add_index "lab_tests", ["test_type_version_id"], name: "index_lab_tests_on_test_type_version_id", using: :btree
  add_index "lab_tests", ["tested_by_id"], name: "index_lab_tests_on_tested_by_id", using: :btree
  add_index "lab_tests", ["work_order_id"], name: "index_lab_tests_on_work_order_id", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "local_id",           limit: 36
    t.integer  "sample_id"
    t.integer  "specimen_id"
    t.integer  "lab_test_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "image_meta"
  end

  add_index "pictures", ["lab_test_id"], name: "index_pictures_on_lab_test_id", using: :btree
  add_index "pictures", ["sample_id"], name: "index_pictures_on_sample_id", using: :btree
  add_index "pictures", ["specimen_id"], name: "index_pictures_on_specimen_id", using: :btree

  create_table "sample_type_versions", force: :cascade do |t|
    t.integer  "sample_type_id"
    t.string   "name",           limit: 255
    t.jsonb    "data"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sample_type_versions", ["sample_type_id"], name: "index_sample_type_versions_on_sample_type_id", using: :btree

  create_table "sample_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.jsonb    "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "samples", force: :cascade do |t|
    t.string   "code",                   limit: 255
    t.text     "remarks"
    t.integer  "sample_type_id"
    t.integer  "sample_type_version_id"
    t.integer  "work_order_id"
    t.jsonb    "data"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "samples", ["sample_type_id"], name: "index_samples_on_sample_type_id", using: :btree
  add_index "samples", ["sample_type_version_id"], name: "index_samples_on_sample_type_version_id", using: :btree
  add_index "samples", ["work_order_id"], name: "index_samples_on_work_order_id", using: :btree

  create_table "specimen_group_relationships", force: :cascade do |t|
    t.integer  "specimen_id"
    t.integer  "specimen_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "specimen_group_relationships", ["specimen_group_id"], name: "index_specimen_group_relationships_on_specimen_group_id", using: :btree
  add_index "specimen_group_relationships", ["specimen_id"], name: "index_specimen_group_relationships_on_specimen_id", using: :btree

  create_table "specimen_groups", force: :cascade do |t|
    t.integer  "work_order_id"
    t.string   "name",          limit: 255
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "specimen_groups", ["work_order_id"], name: "index_specimen_groups_on_work_order_id", using: :btree

  create_table "specimen_type_versions", force: :cascade do |t|
    t.integer  "specimen_type_id"
    t.string   "name",             limit: 255
    t.jsonb    "data"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "specimen_type_versions", ["specimen_type_id"], name: "index_specimen_type_versions_on_specimen_type_id", using: :btree

  create_table "specimen_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.jsonb    "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "specimens", force: :cascade do |t|
    t.string   "code",                     limit: 255
    t.text     "remarks"
    t.integer  "sample_id"
    t.integer  "specimen_type_id"
    t.integer  "specimen_type_version_id"
    t.integer  "prepared_by_id"
    t.jsonb    "data"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "specimens", ["prepared_by_id"], name: "index_specimens_on_prepared_by_id", using: :btree
  add_index "specimens", ["sample_id"], name: "index_specimens_on_sample_id", using: :btree
  add_index "specimens", ["specimen_type_id"], name: "index_specimens_on_specimen_type_id", using: :btree
  add_index "specimens", ["specimen_type_version_id"], name: "index_specimens_on_specimen_type_version_id", using: :btree

  create_table "test_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon"
    t.string   "icon_color"
  end

  create_table "test_type_versions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.jsonb    "data"
    t.integer  "test_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "test_type_versions", ["test_type_id"], name: "index_test_type_versions_on_test_type_id", using: :btree

  create_table "test_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.jsonb    "data"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.boolean  "enabled"
    t.integer  "role"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "organisation_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organisation_id"], name: "index_users_on_organisation_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "work_orders", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.text     "description"
    t.date     "due_date"
    t.integer  "responsible_id"
    t.integer  "work_order_status_id"
    t.integer  "organisation_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "work_orders", ["organisation_id"], name: "index_work_orders_on_organisation_id", using: :btree
  add_index "work_orders", ["responsible_id"], name: "index_work_orders_on_responsible_id", using: :btree
  add_index "work_orders", ["work_order_status_id"], name: "index_work_orders_on_work_order_status_id", using: :btree

  add_foreign_key "lab_tests", "specimens"
  add_foreign_key "lab_tests", "test_statuses"
  add_foreign_key "lab_tests", "test_type_versions"
  add_foreign_key "lab_tests", "test_types"
  add_foreign_key "lab_tests", "users", column: "tested_by_id"
  add_foreign_key "lab_tests", "work_orders"
  add_foreign_key "pictures", "lab_tests"
  add_foreign_key "pictures", "samples"
  add_foreign_key "pictures", "specimens"
  add_foreign_key "sample_type_versions", "sample_types"
  add_foreign_key "samples", "sample_type_versions"
  add_foreign_key "samples", "sample_types"
  add_foreign_key "samples", "work_orders"
  add_foreign_key "specimen_group_relationships", "specimen_groups"
  add_foreign_key "specimen_group_relationships", "specimens"
  add_foreign_key "specimen_groups", "work_orders"
  add_foreign_key "specimen_type_versions", "specimen_types"
  add_foreign_key "specimens", "samples"
  add_foreign_key "specimens", "specimen_type_versions"
  add_foreign_key "specimens", "specimen_types"
  add_foreign_key "specimens", "users", column: "prepared_by_id"
  add_foreign_key "test_type_versions", "test_types"
  add_foreign_key "users", "organisations"
  add_foreign_key "work_orders", "organisations"
  add_foreign_key "work_orders", "users", column: "responsible_id"
  add_foreign_key "work_orders", "work_order_statuses"
end
