class UpdatingDefaultFromWorkOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :work_orders, :nr_revision, :integer
    add_column :work_orders, :nr_revision, :integer, :default => 0
  end
end
