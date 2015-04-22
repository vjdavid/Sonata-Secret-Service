class Project < ActiveRecord::Base
  belongs_to :agent
  has_many :tasks
  has_one :agent
end
