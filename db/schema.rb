# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_529_222_841) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'project_technologies', force: :cascade do |t|
    t.bigint 'project_id', null: false
    t.bigint 'technology_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['project_id'], name: 'index_project_technologies_on_project_id'
    t.index ['technology_id'], name: 'index_project_technologies_on_technology_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'weburl'
    t.string 'giturl'
    t.string 'image'
    t.text 'more'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'featured'
  end

  create_table 'taggings', force: :cascade do |t|
    t.bigint 'tag_id'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_taggings_on_post_id'
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'technologies', force: :cascade do |t|
    t.string 'name'
    t.string 'image'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'project_technologies', 'projects'
  add_foreign_key 'project_technologies', 'technologies'
  add_foreign_key 'taggings', 'posts'
  add_foreign_key 'taggings', 'tags'
end
