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

ActiveRecord::Schema.define(version: 20170628175537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "features", force: :cascade do |t|
    t.float "value"
    t.string "description"
    t.bigint "sample_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_id"], name: "index_features_on_sample_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.text "description"
    t.date "date_of_entry"
    t.float "amount"
    t.string "code"
    t.string "name"
    t.string "brand"
    t.string "product_model"
    t.string "amount_unit"
    t.integer "status", default: 0
    t.bigint "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_inventories_on_laboratory_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "header_image"
    t.string "internal_report"
    t.string "accredited_report"
    t.string "normal_report"
  end

  create_table "menu_permits", force: :cascade do |t|
    t.boolean "view_permit", default: false
    t.boolean "create_permit", default: false
    t.boolean "edit_permit", default: false
    t.boolean "delete_permit", default: false
    t.boolean "available_for_client", default: false
    t.boolean "default", default: false
    t.string "name"
    t.string "tab_reference"
    t.string "tab_icon"
    t.integer "order"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_menu_permits_on_role_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.float "total"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_service_descriptions", force: :cascade do |t|
    t.string "sample_name"
    t.integer "amount"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "tittle"
    t.string "topic"
    t.string "description"
    t.integer "code"
    t.integer "stage", default: 0
    t.integer "status", default: 0
    t.datetime "shipping_date"
    t.bigint "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_requests_on_laboratory_id"
  end

  create_table "roles", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "status", default: 1
    t.bigint "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_roles_on_laboratory_id"
  end

  create_table "sample_categories", force: :cascade do |t|
    t.bigint "laboratory_id"
    t.string "name"
    t.string "description"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_sample_categories_on_laboratory_id"
  end

  create_table "sample_categoryx_sample_methods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sample_category_id"
    t.integer "sample_method_id"
  end

  create_table "sample_features", force: :cascade do |t|
    t.bigint "sample_processed_id"
    t.string "description"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_processed_id"], name: "index_sample_features_on_sample_processed_id"
  end

  create_table "sample_methods", force: :cascade do |t|
    t.string "description"
    t.float "unit_cost"
    t.integer "accreditation"
    t.integer "status", default: 0
    t.bigint "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["laboratory_id"], name: "index_sample_methods_on_laboratory_id"
  end

  create_table "sample_preliminaries", force: :cascade do |t|
    t.bigint "service_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.float "unit_cost", default: 0.0
    t.integer "sample_category_id"
    t.integer "sample_method_id"
    t.index ["service_id"], name: "index_sample_preliminaries_on_service_id"
  end

  create_table "sample_processeds", force: :cascade do |t|
    t.string "description"
    t.string "pucp_code"
    t.string "client_code"
    t.integer "amount"
    t.float "unit_cost"
    t.float "subtotal_cost"
    t.float "discount"
    t.bigint "sample_category_id"
    t.bigint "service_id"
    t.bigint "sample_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_category_id"], name: "index_sample_processeds_on_sample_category_id"
    t.index ["sample_method_id"], name: "index_sample_processeds_on_sample_method_id"
    t.index ["service_id"], name: "index_sample_processeds_on_service_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "laboratory_id"
    t.bigint "employee_id"
    t.bigint "client_id"
    t.string "subject"
    t.date "pick_up_date"
    t.integer "status", default: 0
    t.integer "work_flow", default: 0
    t.boolean "engagement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "intern_flow", default: 0
    t.boolean "valid_classified", default: false
    t.boolean "valid_initial_funded", default: false
    t.integer "nr_revision", default: 0
    t.integer "supervisor_id", default: 0
    t.string "client_quotation_observation"
    t.string "supervisor_quotation_observation"
    t.float "total"
    t.float "subtotal"
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["employee_id"], name: "index_services_on_employee_id"
    t.index ["laboratory_id"], name: "index_services_on_laboratory_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.integer "laboratory_id"
    t.string "name"
    t.string "description"
    t.float "quantity"
    t.string "measureUnit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "users", force: :cascade do |t|
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
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ruc"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "username"
    t.integer "category"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "gender"
    t.integer "status", default: 0
    t.string "job_position"
    t.bigint "laboratory_id"
    t.string "person_contact"
    t.string "contact_person"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["laboratory_id"], name: "index_users_on_laboratory_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "supervisor_id"
    t.integer "sample_processed_id"
    t.string "supervisor_observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nr_revision", default: 0
    t.integer "work_flow", default: 0
    t.boolean "valid_supervised", default: false
    t.integer "report_id"
    t.integer "service_id"
    t.string "subject"
    t.string "internal_report"
    t.string "report_name"
  end

end
