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

ActiveRecord::Schema.define(version: 20150311004731) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "street_address"
    t.string   "number_address"
    t.string   "city"
    t.string   "neighborhood"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "cnpj"
  end

  create_table "company_admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_admins", ["email"], name: "index_company_admins_on_email", unique: true
  add_index "company_admins", ["reset_password_token"], name: "index_company_admins_on_reset_password_token", unique: true

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",                    precision: 8, scale: 2
    t.text     "description"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "product_img_file_name"
    t.string   "product_img_content_type"
    t.integer  "product_img_file_size"
    t.datetime "product_img_updated_at"
    t.integer  "company_id"
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id"

end
