class CreateCustodyOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :custody_orders do |t|
      t.integer :employee_id
      t.integer :supervisor_id
      t.integer :sample_preliminary_id
      t.string :supervisor_observation
      t.integer :service_id
      t.string :subject
      t.integer :sample_processed_id

      t.timestamps
    end
  end
end
