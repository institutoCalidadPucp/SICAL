class AddInternalReportToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :internal_report, :string
  end
end
