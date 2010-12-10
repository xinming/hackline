class CreateFavoriteTasks < ActiveRecord::Migration
  def self.up
    create_table :favorite_tasks do |t|
      t.references :user
      t.references :task

      t.timestamps
    end
  end

  def self.down
    drop_table :favorite_tasks
  end
end
