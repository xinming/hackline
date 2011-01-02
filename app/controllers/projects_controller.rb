class ProjectsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, :js
  
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
  
  def manage_team
    @team = resource.team
    @remaining_users = User.all - @team
    
    team = []
    if params[:method] == "post"
      if params[:team] != nil
        params[:team].each do |key, value|
          user_id = key.gsub("user_", "").to_i
          team.push User.find(user_id)
        end
      end
      
      
      
      add_users = team - @team
      remove_users = @team - team
    
      remove_users.each do |user|
        project_assignment = ProjectAssignment.where("user_id = '#{user.id}' AND project_id = '#{resource.id}'")
        logger.error project_assignment[0].inspect
        project_assignment[0].destroy
      end
    
      add_users.each do |user|
        ProjectAssignment.create(:user_id=> user.id, :project_id => resource.id)
      end
      
    end
    
    @team = team if team
    @remaining_users = User.all - @team
      
  end
  
  
  
end
