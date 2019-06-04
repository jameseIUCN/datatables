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

ActiveRecord::Schema.define(version: 2019_05_24_133543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_topology"
  enable_extension "tablefunc"

  create_table "arrangements", id: :serial, force: :cascade do |t|
    t.string "name"
    t.json "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "status"
    t.json "fields"
    t.integer "sis_assessment_id"
    t.integer "taxon_id"
    t.string "scientific_name"
    t.datetime "sis_last_modified"
    t.boolean "refresh_pending", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50, default: ""
    t.text "comment"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "user_id"
    t.string "role", default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "filter"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "data_tables", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "name"
    t.string "email"
    t.string "hometown"
  end

  create_table "data_tables_2s", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "email"
    t.string "hometown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "export_errors", id: :serial, force: :cascade do |t|
    t.integer "sis_export_id"
    t.string "api_details"
    t.string "error"
    t.text "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "closed"
    t.integer "user_id"
    t.text "description"
    t.integer "arrangement_id"
    t.boolean "locked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums_users", id: :serial, force: :cascade do |t|
    t.integer "forum_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums_working_sets", id: :serial, force: :cascade do |t|
    t.integer "forum_id"
    t.integer "working_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "old_tables", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "hometown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polygons", id: :serial, force: :cascade do |t|
    t.integer "forum_id"
    t.integer "taxon_id"
    t.string "scientific_name"
    t.hstore "attribs"
    t.geometry "geom", limit: {:srid=>0, :type=>"geometry"}
    t.string "shp_file"
    t.integer "num_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribs"], name: "index_polygons_on_attribs", using: :gin
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sis_classifications", id: :serial, force: :cascade do |t|
    t.string "canonical_name"
    t.string "query"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tablename"
    t.hstore "description"
  end

  create_table "sis_exports", id: :serial, force: :cascade do |t|
    t.string "ws_id"
    t.string "status"
    t.string "attachment"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "forum_id"
    t.json "include_files"
  end

  create_table "sis_fields", id: :serial, force: :cascade do |t|
    t.string "canonical_name"
    t.string "filename"
    t.string "required"
    t.boolean "api"
    t.boolean "multiple"
    t.string "datatype"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sis_lookups", id: :serial, force: :cascade do |t|
    t.string "canonical_name"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "values"
    t.string "tablename"
    t.hstore "description"
  end

  create_table "sis_usernames", id: :serial, force: :cascade do |t|
    t.string "username"
  end

  create_table "sis_working_sets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "sis_id"
    t.integer "user_id"
    t.string "scope"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upload_errors", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "filename"
    t.string "error"
    t.text "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "sis_username", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "organisation"
    t.integer "role_id"
    t.boolean "receive_notifications", default: true
    t.boolean "sis_user", default: false
    t.string "sis_email"
    t.string "provider"
    t.string "sis_token"
    t.integer "sis_id"
    t.boolean "active", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "validation_errors", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "error"
    t.text "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_sets", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "upload_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.hstore "properties"
    t.integer "user_id"
    t.string "workflow_state"
    t.hstore "validations"
    t.boolean "records_being_validated"
    t.boolean "taxonomy_being_validated"
    t.boolean "public"
    t.hstore "validation_flags"
    t.boolean "archived"
    t.string "attachmentcw"
    t.boolean "import_subset", default: false
  end

  create_table "ws_all_fields", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_all_fields_on_working_set_id"
  end

  create_table "ws_assessments", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_assessments_on_working_set_id"
  end

  create_table "ws_common_names", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_common_names_on_working_set_id"
  end

  create_table "ws_conservation_neededs", id: :integer, default: -> { "nextval('ws_conservation_needed_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_conservation_needed_on_working_set_id"
  end

  create_table "ws_countries", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_countries_on_working_set_id"
  end

  create_table "ws_credits", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_credits_on_working_set_id"
  end

  create_table "ws_faos", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_faos_on_working_set_id"
  end

  create_table "ws_habitats", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_habitats_on_working_set_id"
  end

  create_table "ws_land_covers", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.boolean "validated", default: false
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["working_set_id"], name: "index_ws_land_covers_on_working_set_id"
  end

  create_table "ws_lmes", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_lmes_on_working_set_id"
  end

  create_table "ws_plant_specifics", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_plant_specifics_on_working_set_id"
  end

  create_table "ws_references", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.string "ref_hash"
    t.index ["working_set_id"], name: "index_ws_references_on_working_set_id"
  end

  create_table "ws_research_neededs", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_research_neededs_on_working_set_id"
  end

  create_table "ws_synonyms", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_synonyms_on_working_set_id"
  end

  create_table "ws_taxonomies", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "drafts_check"
    t.boolean "drafts_check_validated", default: false
    t.string "on_conflict", default: "none"
    t.hstore "validations"
    t.json "taxonomy_check"
    t.boolean "taxonomy_check_pass"
    t.boolean "taxonomy_check_validated", default: false
    t.integer "taxonomy_check_index"
    t.string "on_notes_conflict", default: "none"
    t.boolean "include", default: true
    t.index ["working_set_id"], name: "index_ws_taxonomies_on_working_set_id"
  end

  create_table "ws_threats", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_threats_on_working_set_id"
  end

  create_table "ws_usetrades", id: :serial, force: :cascade do |t|
    t.integer "working_set_id"
    t.string "internal_taxon_id"
    t.hstore "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "validations"
    t.index ["working_set_id"], name: "index_ws_usetrades_on_working_set_id"
  end

  add_foreign_key "users", "roles"
end
