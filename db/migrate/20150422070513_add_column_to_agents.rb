class AddColumnToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :current_project_id, :integer
  end
end
