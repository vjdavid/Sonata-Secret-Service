class AddAgentIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :agent_id, :integer
  end
end
