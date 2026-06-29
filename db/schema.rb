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

ActiveRecord::Schema[8.1].define(version: 2026_06_29_033159) do
  create_table "inquiries", force: :cascade do |t|
    t.text "body"
    t.string "category"
    t.datetime "created_at", null: false
    t.string "crm_ticket_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "reference_number"
    t.integer "service_desk_id"
    t.string "status"
    t.string "topic"
    t.datetime "updated_at", null: false
    t.index ["reference_number"], name: "index_inquiries_on_reference_number", unique: true
    t.index ["service_desk_id"], name: "index_inquiries_on_service_desk_id"
    t.index ["status"], name: "index_inquiries_on_status"
  end

  create_table "inquiry_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "event_type"
    t.string "from_status"
    t.integer "inquiry_id", null: false
    t.string "note"
    t.string "to_status"
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_inquiry_events_on_inquiry_id"
  end

  create_table "routing_rules", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.integer "priority"
    t.integer "service_desk_id", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_routing_rules_on_category"
    t.index ["service_desk_id"], name: "index_routing_rules_on_service_desk_id"
  end

  create_table "service_desks", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inquiries", "service_desks"
  add_foreign_key "inquiry_events", "inquiries"
  add_foreign_key "routing_rules", "service_desks"
end
