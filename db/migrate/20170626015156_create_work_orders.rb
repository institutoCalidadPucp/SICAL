class CreateWorkOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :work_orders do |t|
      t.integer :employee_id
      t.integer :supervisor_id
      t.integer :sample_processed_id
      t.integer :nr_revision
      t.string :supervisor_observation

      t.timestamps
    end
  end
end
