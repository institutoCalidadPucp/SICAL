class AddValidSupervisedToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :valid_supervised, :boolean, :default => false
  end
end
