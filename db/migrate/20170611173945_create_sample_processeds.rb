class CreateSampleProcesseds < ActiveRecord::Migration[5.1]
  def change
    create_table :sample_processeds do |t|
      t.string :description
      t.string :pucp_code
      t.string :client_code
      t.integer :amount
      t.float :unit_cost
      t.float :subtotal_cost
      t.float :discount
      t.belongs_to :sample_category
      t.belongs_to :service
      t.belongs_to :sample_method
      t.belongs_to :user
      t.timestamps
    end
  end
end
