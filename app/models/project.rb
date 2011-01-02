class Project < ActiveRecord::Base
  has_many :tasklists, :dependent => :destroy
  has_many :project_assignments, :dependent => :destroy
  def to_s
    return self.name
  end
  
  def team
    result = []
    project_assignments.each do |assignment|
      result.push assignment.user
    end
    return result
  end
end

