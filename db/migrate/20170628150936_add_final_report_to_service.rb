class AddFinalReportToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :final_report, :string
  end
end
