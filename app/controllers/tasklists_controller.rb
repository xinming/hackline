class TasklistsController < InheritedResources::Base
  belongs_to :project, :optional => true

  before_filter :authenticate_user!
end
