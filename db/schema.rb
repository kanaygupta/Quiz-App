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

ActiveRecord::Schema.define(version: 20170917115125) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lecategories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_id"
    t.integer "actscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "created_at"], name: "index_lecategories_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_lecategories_on_category_id"
    t.index ["user_id", "created_at"], name: "index_lecategories_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lecategories_on_user_id"
  end

  create_table "lequizzes", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "user_id"
    t.integer "actscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id", "created_at"], name: "index_lequizzes_on_quiz_id_and_created_at"
    t.index ["quiz_id"], name: "index_lequizzes_on_quiz_id"
    t.index ["user_id", "created_at"], name: "index_lequizzes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lequizzes_on_user_id"
  end

  create_table "lesubcategories", force: :cascade do |t|
    t.integer "subcategory_id"
    t.integer "user_id"
    t.integer "actscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id", "created_at"], name: "index_lesubcategories_on_subcategory_id_and_created_at"
    t.index ["subcategory_id"], name: "index_lesubcategories_on_subcategory_id"
    t.index ["user_id", "created_at"], name: "index_lesubcategories_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lesubcategories_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id"
    t.text "content"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.string "answer"
    t.string "q_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id", "created_at"], name: "index_questions_on_quiz_id_and_created_at"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.integer "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id", "created_at"], name: "index_quizzes_on_subcategory_id_and_created_at"
    t.index ["subcategory_id"], name: "index_quizzes_on_subcategory_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quiz_id"
    t.integer "actscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id", "created_at"], name: "index_scores_on_quiz_id_and_created_at"
    t.index ["quiz_id"], name: "index_scores_on_quiz_id"
    t.index ["user_id", "created_at"], name: "index_scores_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quiz_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "created_at"], name: "index_states_on_question_id_and_created_at"
    t.index ["question_id"], name: "index_states_on_question_id"
    t.index ["quiz_id", "created_at"], name: "index_states_on_quiz_id_and_created_at"
    t.index ["quiz_id"], name: "index_states_on_quiz_id"
    t.index ["user_id", "created_at"], name: "index_states_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_states_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "created_at"], name: "index_subcategories_on_category_id_and_created_at"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
