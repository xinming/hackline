class TasksController < InheritedResources::Base
  belongs_to :tasklist, :optional => true
  
  before_filter :authenticate_user!
  
  def create
    @task = Task.new(params[:task])
    
    #Assign the current user as the creator of that task
    @task.user = current_user
    
    create!
  end
  
  def done
    resource.done = true
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is done!"
  end
  
  def undone
    resource.done = false
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is undone!"
  end
end
