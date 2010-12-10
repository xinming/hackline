class Tasklist < ActiveRecord::Base
  belongs_to :project
  has_many :tasks

  def to_s
    return self.name
  end
end
