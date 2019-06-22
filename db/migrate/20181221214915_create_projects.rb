# typed: true
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :weburl
      t.string :giturl
      t.string :image
      t.text :more

      t.timestamps
    end
  end
end
