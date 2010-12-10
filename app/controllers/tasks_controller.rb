class TasksController < InheritedResources::Base
  belongs_to :tasklist, :optional => true
  
  before_filter :authenticate_user!
  
  def create
    @task = Task.new(params[:task])
    
    #Assign the current user as the creator of that task
    @task.user = current_user
    
    create!
  end
end
