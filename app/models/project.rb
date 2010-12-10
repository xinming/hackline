class Project < ActiveRecord::Base
  has_many :tasklists
  
  def to_s
    return self.name
  end
end