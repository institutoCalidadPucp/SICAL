class AddReportIdToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :report_id, :integer
  end
end
