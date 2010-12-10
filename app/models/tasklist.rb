class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy

  def assigned_users
    people = []
    self.tasks.each do |task|
      people += task.assigned_users
    end
    return people.uniq
  end

  def to_s
    return self.name
  end
end
