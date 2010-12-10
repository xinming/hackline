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
  
  #Favorite Feature
  
  def favorite
    unless current_user.favorited_tasks.include?(resource)
      current_user.favorited_tasks << resource
      current_user.save
      redirect_to collection_url, :notice => "Task: #{resource.body} is favorited!"
    end
  end
  
  def unfavorite
    if current_user.favorited_tasks.include?(resource)
      current_user.favorited_tasks.delete resource
      current_user.save
      redirect_to collection_url, :notice => "Task: #{resource.body} is unfavorited!"
    end
  end
end
