class AddCustodyOrderIdToSampleProcessed < ActiveRecord::Migration[5.1]
  def change
    add_column :sample_processeds, :custody_order_id, :integer
  end
end
