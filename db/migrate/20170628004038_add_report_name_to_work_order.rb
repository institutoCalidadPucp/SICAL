class AddReportNameToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :report_name, :string
  end
end
