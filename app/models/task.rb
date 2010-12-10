class Task < ActiveRecord::Base
  belongs_to :tasklist
  belongs_to :user
end
