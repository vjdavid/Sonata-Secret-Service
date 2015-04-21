class Agent < ActiveRecord::Base
  validates :name, :email, presence: :true
  has_many :projects
end
