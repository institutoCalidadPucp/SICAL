class AddSubjectToWorkOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :work_orders, :subject, :string
  end
end
