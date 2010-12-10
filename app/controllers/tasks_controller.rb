class TasksController < InheritedResources::Base
  belongs_to :tasklist, :optional => true
end
