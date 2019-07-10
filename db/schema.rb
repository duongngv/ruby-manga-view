ActiveRecord::Schema.define(version: 2019_07_10_021216) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "manga_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comic_categories", force: :cascade do |t|
    t.integer "manga_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comic_followers", force: :cascade do |t|
  end

  create_table "comics", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.text "description"
    t.string "thumb"
    t.boolean "finished"
    t.integer "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "chapter_id"
    t.string "content"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "chapter_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "manga_id"
    t.integer "user_id"
    t.integer "relationshipable_id"
    t.string "relationshipable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id", "user_id"], name: "index_relationships_on_manga_id_and_user_id", unique: true
    t.index ["manga_id"], name: "index_relationships_on_manga_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "is_admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
  end

end
