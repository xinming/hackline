class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.boolean :done
      t.datetime :completed_on
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
