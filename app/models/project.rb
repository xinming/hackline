class Project < ActiveRecord::Base
  has_many :tasklists, :dependent => :destroy
  
  def to_s
    return self.name
  end
end