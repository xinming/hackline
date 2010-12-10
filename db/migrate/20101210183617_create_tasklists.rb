class CreateTasklists < ActiveRecord::Migration
  def self.up
    create_table :tasklists do |t|
      t.references :project
      t.string :name
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :tasklists
  end
end
