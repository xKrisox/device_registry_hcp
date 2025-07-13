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

# This schema defines the structure of the device registry application's database.
#
# The database is designed to support secure user authentication, device assignment,
# device return (unassign), and API access management.
#
# Tables:
# - users: Stores user accounts with unique emails and encrypted passwords.
# - devices: Stores physical devices, each linked to a user (owner), with a unique serial number.
#   Includes 'returned' (boolean) to track if a device has been returned, and 'deleted_at' (datetime)
#   for soft-deletion (logical removal without losing history).
# - api_keys: Stores API tokens for authentication, supporting polymorphic association to users.
#
# Relationships:
# - Each device belongs to a user (user_id foreign key).
# - Devices can be soft-deleted (deleted_at) and marked as returned (returned).
# - API keys are linked to users for secure access.
#
# This structure allows:
# - Assigning devices to users and tracking their status/history.
# - Returning devices and preventing re-assignment if already returned.
# - Secure authentication and API access.
#
# The schema is generated from migrations and should not be edited directly.
# All changes should be made via migration files to ensure consistency and traceability.

ActiveRecord::Schema[7.1].define(version: 2025_07_13_024423) do
  create_table "api_keys", force: :cascade do |t|
    t.integer "bearer_id", null: false
    t.string "bearer_type", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bearer_id", "bearer_type"], name: "index_api_keys_on_bearer_id_and_bearer_type"
    t.index ["token"], name: "index_api_keys_on_token", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.datetime "deleted_at"
    t.boolean "returned"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "devices", "users"
end
