class AddWorkFlowToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :work_flow, :integer, :default => 0
  end
end
