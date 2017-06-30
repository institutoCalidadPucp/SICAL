class RemoveReportId2FromWorkOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :work_orders, :report_id, :integer
  end
end
