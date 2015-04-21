class AddAgentIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :agent_id, :string
  end
end
