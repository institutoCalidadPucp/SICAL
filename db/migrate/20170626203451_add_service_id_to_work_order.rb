class AddServiceIdToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :service_id, :integer
  end
end
