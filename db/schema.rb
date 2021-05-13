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

ActiveRecord::Schema.define(version: 2019_01_22_183233) do

  create_table "api_keys", id: :integer, options: "CREATE TABLE \"api_keys\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"key\" varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"user_id\" int DEFAULT NULL,\n  \"last_access_at\" datetime DEFAULT NULL,\n  \"last_access_ip\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"access_count\" int NOT NULL DEFAULT '0',\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_api_keys_on_key\" (\"key\"),\n  KEY \"index_api_keys_on_user_id\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_32c28d0dc2\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "key", limit: 50
    t.integer "user_id"
    t.datetime "last_access_at"
    t.string "last_access_ip"
    t.integer "access_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_api_keys_on_key", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "collections", id: :integer, options: "CREATE TABLE \"collections\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"user_id\" int DEFAULT NULL,\n  \"name\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"documents_count\" int NOT NULL DEFAULT '0',\n  \"note\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"source\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"cdate\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"key\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"xml_url\" varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"annotations_count\" int DEFAULT '0',\n  \"order_no\" int DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_collections_on_user_id\" (\"user_id\"),\n  KEY \"index_collections_on_key\" (\"key\"),\n  KEY \"index_collections_on_user_id_and_order_no\" (\"user_id\",\"order_no\"),\n  CONSTRAINT \"fk_rails_9b33697360\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "documents_count", default: 0, null: false
    t.string "note"
    t.string "source"
    t.string "cdate"
    t.string "key"
    t.string "xml_url", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "annotations_count", default: 0
    t.integer "order_no"
    t.index ["key"], name: "index_collections_on_key"
    t.index ["user_id", "order_no"], name: "index_collections_on_user_id_and_order_no"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "documents", id: :integer, options: "CREATE TABLE \"documents\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"collection_id\" int DEFAULT NULL,\n  \"did\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"user_updated_at\" datetime DEFAULT NULL,\n  \"tool_updated_at\" datetime DEFAULT NULL,\n  \"annotations_count\" int NOT NULL DEFAULT '0',\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"xml\" longtext COLLATE utf8mb4_unicode_ci,\n  \"title\" text COLLATE utf8mb4_unicode_ci,\n  \"key\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"did_no\" int DEFAULT NULL,\n  \"batch_id\" int DEFAULT '0',\n  \"batch_no\" int DEFAULT '0',\n  \"done\" tinyint(1) DEFAULT '0',\n  \"curatable\" tinyint(1) DEFAULT '1',\n  \"order_no\" int DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_documents_on_collection_id\" (\"collection_id\"),\n  KEY \"index_documents_on_did\" (\"did\"),\n  KEY \"index_documents_on_collection_id_and_order_no\" (\"collection_id\",\"order_no\"),\n  CONSTRAINT \"fk_rails_d1954ada41\" FOREIGN KEY (\"collection_id\") REFERENCES \"collections\" (\"id\")\n)", force: :cascade do |t|
    t.integer "collection_id"
    t.string "did"
    t.datetime "user_updated_at"
    t.datetime "tool_updated_at"
    t.integer "annotations_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "xml", limit: 4294967295
    t.text "title"
    t.string "key"
    t.integer "did_no"
    t.integer "batch_id", default: 0
    t.integer "batch_no", default: 0
    t.boolean "done", default: false
    t.boolean "curatable", default: true
    t.integer "order_no"
    t.index ["collection_id", "order_no"], name: "index_documents_on_collection_id_and_order_no"
    t.index ["collection_id"], name: "index_documents_on_collection_id"
    t.index ["did"], name: "index_documents_on_did"
  end

  create_table "entity_types", id: :integer, options: "CREATE TABLE \"entity_types\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"collection_id\" int DEFAULT NULL,\n  \"name\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"color\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_entity_types_on_collection_id\" (\"collection_id\"),\n  CONSTRAINT \"fk_rails_fbdba14b5f\" FOREIGN KEY (\"collection_id\") REFERENCES \"collections\" (\"id\")\n)", force: :cascade do |t|
    t.integer "collection_id"
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_entity_types_on_collection_id"
  end

  create_table "lexicon_groups", id: :integer, options: "CREATE TABLE \"lexicon_groups\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"name\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"user_id\" int DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"lexicons_count\" int DEFAULT '0',\n  \"key\" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_lexicon_groups_on_user_id\" (\"user_id\"),\n  KEY \"index_lexicon_groups_on_key\" (\"key\"),\n  CONSTRAINT \"fk_rails_6a10cb9c14\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lexicons_count", default: 0
    t.string "key", limit: 100
    t.index ["key"], name: "index_lexicon_groups_on_key"
    t.index ["user_id"], name: "index_lexicon_groups_on_user_id"
  end

  create_table "lexicons", id: :integer, options: "CREATE TABLE \"lexicons\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"ltype\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"lexicon_id\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"name\" text COLLATE utf8mb4_unicode_ci,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"lexicon_group_id\" int DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_lexicons_on_lexicon_id\" (\"lexicon_id\"),\n  KEY \"index_lexicons_on_lexicon_group_id\" (\"lexicon_group_id\"),\n  CONSTRAINT \"fk_rails_c22eba49bc\" FOREIGN KEY (\"lexicon_group_id\") REFERENCES \"lexicon_groups\" (\"id\")\n)", force: :cascade do |t|
    t.string "ltype"
    t.string "lexicon_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lexicon_group_id"
    t.index ["lexicon_group_id"], name: "index_lexicons_on_lexicon_group_id"
    t.index ["lexicon_id"], name: "index_lexicons_on_lexicon_id"
  end

  create_table "models", id: :integer, options: "CREATE TABLE \"models\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"url\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"user_id\" int DEFAULT NULL,\n  \"name\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\"),\n  KEY \"index_models_on_user_id\" (\"user_id\"),\n  CONSTRAINT \"fk_rails_94ca00d51b\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\")\n)", force: :cascade do |t|
    t.string "url"
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_models_on_user_id"
  end

  create_table "tasks", id: :integer, options: "CREATE TABLE \"tasks\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"user_id\" int DEFAULT NULL,\n  \"collection_id\" int DEFAULT NULL,\n  \"tagger\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"task_type\" int DEFAULT NULL,\n  \"pre_trained_model\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"status\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"tool_begin_at\" datetime DEFAULT NULL,\n  \"tool_end_at\" datetime DEFAULT NULL,\n  \"canceled_at\" datetime DEFAULT NULL,\n  \"model_id\" int DEFAULT NULL,\n  \"lexicon_group_id\" int DEFAULT NULL,\n  \"has_model\" tinyint(1) DEFAULT '0',\n  \"has_lexicon_group\" tinyint(1) DEFAULT '0',\n  PRIMARY KEY (\"id\"),\n  KEY \"index_tasks_on_user_id\" (\"user_id\"),\n  KEY \"index_tasks_on_collection_id\" (\"collection_id\"),\n  KEY \"index_tasks_on_model_id\" (\"model_id\"),\n  KEY \"index_tasks_on_lexicon_group_id\" (\"lexicon_group_id\"),\n  CONSTRAINT \"fk_rails_4d2a9e4d7e\" FOREIGN KEY (\"user_id\") REFERENCES \"users\" (\"id\"),\n  CONSTRAINT \"fk_rails_74e604f756\" FOREIGN KEY (\"model_id\") REFERENCES \"models\" (\"id\"),\n  CONSTRAINT \"fk_rails_ba46bfe072\" FOREIGN KEY (\"collection_id\") REFERENCES \"collections\" (\"id\"),\n  CONSTRAINT \"fk_rails_fb82bc7755\" FOREIGN KEY (\"lexicon_group_id\") REFERENCES \"lexicon_groups\" (\"id\")\n)", force: :cascade do |t|
    t.integer "user_id"
    t.integer "collection_id"
    t.string "tagger"
    t.integer "task_type"
    t.string "pre_trained_model"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "tool_begin_at"
    t.datetime "tool_end_at"
    t.datetime "canceled_at"
    t.integer "model_id"
    t.integer "lexicon_group_id"
    t.boolean "has_model", default: false
    t.boolean "has_lexicon_group", default: false
    t.index ["collection_id"], name: "index_tasks_on_collection_id"
    t.index ["lexicon_group_id"], name: "index_tasks_on_lexicon_group_id"
    t.index ["model_id"], name: "index_tasks_on_model_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "upload_batches", id: :integer, options: "CREATE TABLE \"upload_batches\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  PRIMARY KEY (\"id\")\n)", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, options: "CREATE TABLE \"users\" (\n  \"id\" int NOT NULL AUTO_INCREMENT,\n  \"session_str\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"ip\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"created_at\" datetime NOT NULL,\n  \"updated_at\" datetime NOT NULL,\n  \"email\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"encrypted_password\" varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',\n  \"reset_password_token\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"reset_password_sent_at\" datetime DEFAULT NULL,\n  \"remember_created_at\" datetime DEFAULT NULL,\n  \"sign_in_count\" int NOT NULL DEFAULT '0',\n  \"current_sign_in_at\" datetime DEFAULT NULL,\n  \"last_sign_in_at\" datetime DEFAULT NULL,\n  \"current_sign_in_ip\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"last_sign_in_ip\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  \"super_admin\" tinyint(1) DEFAULT '0',\n  \"name\" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  PRIMARY KEY (\"id\"),\n  UNIQUE KEY \"index_users_on_email\" (\"email\"),\n  UNIQUE KEY \"index_users_on_reset_password_token\" (\"reset_password_token\"),\n  KEY \"index_users_on_session_str\" (\"session_str\"),\n  KEY \"index_users_on_ip\" (\"ip\")\n)", force: :cascade do |t|
    t.string "session_str"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "super_admin", default: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["ip"], name: "index_users_on_ip"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["session_str"], name: "index_users_on_session_str"
  end

  add_foreign_key "api_keys", "users"
  add_foreign_key "collections", "users"
  add_foreign_key "documents", "collections"
  add_foreign_key "entity_types", "collections"
  add_foreign_key "lexicon_groups", "users"
  add_foreign_key "lexicons", "lexicon_groups"
  add_foreign_key "models", "users"
  add_foreign_key "tasks", "collections"
  add_foreign_key "tasks", "lexicon_groups"
  add_foreign_key "tasks", "models"
  add_foreign_key "tasks", "users"
end
