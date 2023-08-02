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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_082612) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "door_number"
    t.string "floor_number"
    t.string "building_name"
    t.string "street_name"
    t.string "area"
    t.string "village"
    t.string "town"
    t.string "city"
    t.string "pincode"
    t.string "landmark"
    t.string "district"
    t.string "state"
    t.string "country"
    t.string "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "officials", force: :cascade do |t|
    t.string "company"
    t.string "role"
    t.string "employee_id"
    t.string "employee_mail"
    t.string "laptop_serial"
    t.string "laptop_model"
    t.string "laptop_brand"
    t.string "laptop_mac"
    t.boolean "waterbottle"
    t.boolean "headset"
    t.boolean "mobile"
    t.boolean "bag"
    t.string "experience"
    t.string "account_holder_name"
    t.string "account_number"
    t.string "bank_name"
    t.string "branch"
    t.string "ifsc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personals", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.date "dob"
    t.string "tenth_mark"
    t.string "twelfth_mark"
    t.string "school_name"
    t.string "college_degree"
    t.string "college_name"
    t.float "cgpa"
    t.string "father_name"
    t.string "mother_name"
    t.string "father_mobile"
    t.string "mother_mobile"
    t.string "caste"
    t.string "religion"
    t.string "username"
    t.string "password"
    t.string "marital_status"
    t.string "instagram_acc"
    t.string "twitter_acc"
    t.string "facebook_acc"
    t.string "gender"
    t.string "community"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
