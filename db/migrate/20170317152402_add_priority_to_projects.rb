class AddPriorityToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :priority, :integer
  end
end
