class Agent < ActiveRecord::Base
  has_many :projects
  belongs_to :project
end
