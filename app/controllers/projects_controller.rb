class ProjectsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def active
    resource.active = true
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is done!"
  end
  
  def inactive
    resource.active = false
    resource.save
    redirect_to collection_url, :notice => "Task: #{resource.body} is undone!"
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
