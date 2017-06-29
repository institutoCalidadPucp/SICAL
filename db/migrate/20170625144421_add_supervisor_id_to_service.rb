class AddSupervisorIdToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :supervisor_id, :integer, default: 0
  end
end
