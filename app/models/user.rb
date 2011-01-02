class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :favorite_tasks
  has_many :favorited_tasks, :through => :favorite_tasks, :source => :task
  
  
  has_many :project_assignments, :dependent => :destroy
  
  
  def to_s
    return self.email
  end
end
