class Task < ActiveRecord::Base
  belongs_to :tasklist
  belongs_to :user
  
  has_many :task_assignments, :dependent => :destroy
  has_many :assigned_users, :through => :task_assignments, :source => :user
  
  def to_s
    return self.body
  end
  
  #Favorite Task
  has_many :favorite_tasks
  has_many :favorited_by_users, :through => :favorite_tasks, :source => :user
end
