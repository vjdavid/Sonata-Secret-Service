class Project < ActiveRecord::Base
  belongs_to :agent
  has_many :tasks
end
