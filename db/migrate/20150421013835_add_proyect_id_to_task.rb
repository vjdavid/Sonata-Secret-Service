class AddProyectIdToTask < ActiveRecord::Migration
  def change
	  add_column :tasks, :project_id, :string
  end
end
