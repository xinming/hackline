class TasksController < InheritedResources::Base
  belongs_to :tasklist, :optional => true
  
  before_filter :authenticate_user!
  
  def create
    @task = Task.new(params[:task])
    
    #Assign the current user as the creator of that task
    @task.user = current_user
    
    create!
  end
  
  def start
    resource.started = DateTime.now
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} has been started!"
  end
  
  def unstart
    resource.started = nil
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} has been unstarted!"
  end
  
  def done
    resource.done = true
    resource.completed_on = DateTime.now
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is done!"
  end
  
  def undone
    resource.done = false
    resource.completed_on = nil
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is undone!"
  end
end
