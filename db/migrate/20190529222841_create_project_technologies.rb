# frozen_string_literal: true

class CreateProjectTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_technologies do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
