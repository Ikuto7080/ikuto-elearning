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

ActiveRecord::Schema.define(version: 2021_01_26_085637) do

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "action_type"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id", "action_type"], name: "index_activities_on_action_id_and_action_type"
    t.index ["action_type", "action_id"], name: "index_activities_on_action_type_and_action_id"
    t.index ["user_id", "created_at"], name: "index_activities_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "choice_id"
    t.integer "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id", "created_at"], name: "index_answers_on_choice_id_and_created_at"
    t.index ["lesson_id", "created_at"], name: "index_answers_on_lesson_id_and_created_at"
    t.index ["word_id", "created_at"], name: "index_answers_on_word_id_and_created_at"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "word_id"
    t.boolean "correct_ans", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.boolean "is_completed", default: false
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "created_at"], name: "index_lessons_on_category_id_and_created_at"
    t.index ["user_id", "created_at"], name: "index_lessons_on_user_id_and_created_at"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "users"
end
