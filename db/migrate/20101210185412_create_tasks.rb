class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.references :tasklist
      t.text :body
      t.references :user
      t.boolean :done
      t.date :deadline
      t.datetime :started
      t.datetime :completed_on

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
