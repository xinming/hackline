class TasklistsController < InheritedResources::Base
  belongs_to :project, :optional => true
end
