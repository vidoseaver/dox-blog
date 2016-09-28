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

ActiveRecord::Schema.define(version: 20151106190015) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.boolean  "featured",                      default: false
    t.text     "body",            limit: 65535
    t.boolean  "published"
    t.integer  "author_id",       limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "slug",            limit: 255
    t.string   "subtitle",        limit: 255
    t.string   "hero_image_name", limit: 255
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["featured"], name: "index_articles_on_featured", using: :btree
  add_index "articles", ["published"], name: "index_articles_on_published", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.boolean  "active",                   default: true
    t.string   "twitter",    limit: 255
    t.text     "about",      limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "slug",       limit: 255
  end

  add_index "authors", ["slug"], name: "index_authors_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hero_images", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.boolean  "featured",                      default: false
    t.text     "body",            limit: 65535
    t.boolean  "published"
    t.integer  "author_id",       limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "slug",            limit: 255
    t.string   "hero_image_name", limit: 255
    t.string   "subtitle",        limit: 255
  end

  add_index "pages", ["author_id"], name: "index_pages_on_author_id", using: :btree
  add_index "pages", ["featured"], name: "index_pages_on_featured", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  add_foreign_key "articles", "authors"
  add_foreign_key "pages", "authors"
end
