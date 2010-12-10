class Task < ActiveRecord::Base
  belongs_to :tasklist
  belongs_to :user
  
  has_many :task_assignments
  has_many :assigned_users, :through => :task_assignments, :source => :user
  
  def to_s
    return self.body
  end
end
